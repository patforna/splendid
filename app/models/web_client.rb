class WebClient

  def post(content)
    # FIXME use config
    # message_service_host = 'xml1.aspsms.com'
    host = 'localhost'
    port = 9090

    uri = URI.parse("http://#{host}:#{port}/xmlsvr.asp")

    Rails.logger.debug "Posting content to #{uri}."

    request = Net::HTTP::Post.new(uri.path)
    request.content_type = 'text/xml'
    request.content_length = content.length
    response = Net::HTTP.start(uri.host, uri.port) { |http|
      http.request(request, content)
    }
    
    Rails.logger.debug "Received HTTP response: #{response.code}."
    response.error! unless response.kind_of? Net::HTTPSuccess
  end

end
