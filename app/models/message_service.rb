class MessageService

  def initialize
    @builder = XmlBuilder.new
    @webClient = WebClient.new
  end

  def send(message)
    @webClient.post @builder.from message
  end
end
