class XmlBuilder
  
  SEND = 'SendTextSMS'
  
  def from(message)
    Nokogiri::XML::Builder.new do
      aspsms {
        recipient {
          phonenumber { text message.recipient }
        }
        messagedata { text message.message }
        action { text SEND }
      }
    end.to_xml
  end
end
