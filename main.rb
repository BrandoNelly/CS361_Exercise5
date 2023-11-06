# Exercise 5

class DiscussionWorkflow
    attr_accessor :discussion
    def initialize(discussion)
      @discussion = discussion
    end
  
    # Expects @participants array to be filled with User objects
    def launch_discussion_workflow
      return unless valid?
      run_callbacks(:create) do
        ActiveRecord::Base.transaction do
          discussion.save!
          create_discussion_roles!
          @successful = true
        end
      end
    end
  
    
  
    # ...
  
  end

class User
  attr_accessor :email, :password

  def initialize(email)
    @email = email
    @password = password
  end

  def create_from_email(email, password)
    new(email.downcase)
  end

end


class Participant
    attr_accessor :participants, :participants_email_string
  
  def initialize(participants, participants_email_string)
      @participants = []
      @participants_email_string = participants_email_string
  end


  def generate_participant_users_from_email_string(email_string)
      return if @participants_email_string.blank?
          @participants_email_string.split.uniq.map do |email_address|
          User.create_from_email(email: email_address.downcase, password: Device.friendly_token)
      end
  end


class Discussion
  attr_accessor :title, :host, :participants

  def initialize(title, host, participants_list)
      @title = title
      @host = host
      @participants = participants
  end
end
    


  participants = Participant.new(50,"fake1@example.com\nfake2@example.com\nfake3@example.com" )
  host = User.find(42)
  discussion = Discussion.new(title: "fake", host, participants)

  workflow = DiscussionWorkflow.new(discussion)
  workflow.generate_participant_users_from_email_string
  workflow.launch_discussion_workflow