class XmlBuilder
  def from(message)
    builder = Nokogiri::XML::Builder.new do
      aspsms {
        recipient {
          phonenumber { text message.recipient }
        }
      }
    end
    builder.to_xml
  end
end
