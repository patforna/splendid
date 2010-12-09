require 'spec_helper'

describe XmlBuilder do

  # <?xml version="1.0" encoding="ISO-8859-1"?>
  # <aspsms>
  #   <Userkey>userkey</Userkey>
  #   <Password>password</Password>
  #   <Originator>originator</Originator>
  #   <Recipient>
  #     <PhoneNumber>00000000</PhoneNumber>
  #   </Recipient>
  #   <MessageData>foo</MessageData>
  #   <Action>SendTextSMS</Action>
  # </aspsms>
  

  before(:each) do
    @builder = XmlBuilder.new
  end
  
  def build_from(message)
    Nokogiri::Slop(@builder.from(message))
  end

  describe "From" do
    
    it "should serialise the recipient" do
      message = Message.new :recipient => "12345"
      xml = build_from(message)
      xml.aspsms.recipient.phonenumber.content.should == message.recipient
    end
    
    it "should serialise the message content" do
      message = Message.new :message => "Fish like plankton"
      xml = build_from(message)
      xml.aspsms.messagedata.content.should == message.message
    end
    
    it "should set the action to SendTextSMS" do
      xml = build_from(Message.new)
      xml.aspsms.action.content.should == 'SendTextSMS'
    end
    
  end

end
