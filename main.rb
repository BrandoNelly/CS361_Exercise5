# Exercise 5

class DiscussionWorkflow

    def initialize(discussion, host)
      @discussion = discussion
      @host = host
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
  



class Participant

    def initialize(participants, participants_email_string)
       @participants = []
       @participants_email_string = participants_email_string
    end


    def generate_participant_users_from_email_string
        return if @participants_email_string.blank?
            @participants_email_string.split.uniq.map do |email_address|
            User.create(email: email_address.downcase, password: Device.friendly_token)
        end
    end


  class Discussion

    def initialize(title, host, participants_list)
        @title = title
        @host = host
        @participants_list = participants
    end
    


  discussion = Discussion.new(title: "fake", ...)
  host = User.find(42)
  participants = "fake1@example.com\nfake2@example.com\nfake3@example.com"
  
  workflow = DiscussionWorkflow.new(discussion, host, participants)ikr6qat62
  workflow.generate_participant_users_from_email_string
  workflow.run