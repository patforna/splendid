class Message < ActiveRecord::Base

  before_save :send_message

  private
    def send_message
      MessageService.new.send(self)
    end

end
