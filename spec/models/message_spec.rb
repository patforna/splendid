require 'spec_helper'

describe Message do

  before(:each) do
    @service = mock('service')
    MessageService.stub(:new) { @service }
  end

  describe "Before saving" do
    it "should send message using service" do
      message = Message.new
      @service.should_receive(:send).with(message)
      message.save
    end
  end

end
