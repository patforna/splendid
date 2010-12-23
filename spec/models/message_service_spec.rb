require 'spec_helper'

describe MessageService do

  before(:each) do
    @builder = mock('builder')
    XmlBuilder.stub(:new) { @builder }

    @webClient = mock('webClient')
    WebClient.stub(:new) { @webClient }

    @service = MessageService.new
  end

  describe "Send" do
    it "should post serialised message using web client" do
      @builder.should_receive(:from).with(:message).and_return(:some_xml)
      @webClient.should_receive(:post).with(:some_xml)
      @service.send(:message)
    end
    
    it "should deal with error responses"
    # <aspsms><ErrorCode>26</ErrorCode><ErrorDescription>IP-Address not Authorized for this Operation</ErrorDescription></aspsms>
  end

end
