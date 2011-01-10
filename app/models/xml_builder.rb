require 'nokogiri'

class XmlBuilder

  SEND = 'SendTextSMS'

  def from(message)
    Nokogiri::XML::Builder.new do
      aspsms {
        Userkey { text 'foo' }
        Password { text 'bar' }
        Originator {text '+447807922168' }
        Recipient {
          PhoneNumber { text message.recipient }
        }
        MessageData { text message.content }
        Action { text SEND }
      }
    end.to_xml
  end
end
