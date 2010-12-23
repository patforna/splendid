require 'nokogiri'

class XmlBuilder

  SEND = 'SendTextSMS'

  def from(message)
    Nokogiri::XML::Builder.new do
      aspsms {
        Userkey { text 'foo' }
        Password { text 'bar' }
        Originator {text 'baz' }
        Recipient {
          PhoneNumber { text message.recipient }
        }
        MessageData { text message.message }
        Action { text SEND }
      }
    end.to_xml
  end
end
