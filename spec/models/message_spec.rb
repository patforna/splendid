require 'spec_helper'

describe Message do
  
  describe "Before saving" do
    it "should dispatch message using service" do
      mock_service = mock(SmsService)
      SmsService.stub(:new) { mock_service }
      
      message = Message.new
      message.save
      
      mock_service.should_receive(:dispatch)
    end
  end
  
end
