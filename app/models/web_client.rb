class WebClient

  def post(content)
    host = APP_CONFIG['host']
    port = APP_CONFIG['port']
    uri = URI.parse("http://#{host}:#{port}/xmlsvr.asp")

    Rails.logger.debug "Posting content to #{uri}."

    request = Net::HTTP::Post.new(uri.path)
    request.content_type = 'text/xml'
    request.content_length = content.length
    response = Net::HTTP.start(uri.host, uri.port) { |http|
      http.request(request, content)
    }
    
    Rails.logger.debug "Received HTTP response: #{response.code}."
    Rails.logger.debug "HTTP response body was: #{response.body}."
    response.error! unless response.kind_of? Net::HTTPSuccess
  end

end
