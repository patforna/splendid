class WebClient

  def post(content)
    uri = URI.parse("http://xml1.aspsms.com/xmlsvr.asp")
    request = Net::HTTP::Post.new(uri.path)
    request.content_type = 'text/xml'
    request.content_length = 33
    response = Net::HTTP.start(uri.host, uri.port) { |http|
      http.request(request, content)
    }
    response.error! unless response.kind_of? Net::HTTPSuccess
  end

end
