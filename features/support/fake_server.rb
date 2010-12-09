class FakeServer
  def initialize
    Thread.new do
      SinatraBase.run! :host => 'localhost', :port => 9090
    end
    sleep 1
  end

  def received_request?
    RequestStore.instance.load
  end
end

require 'sinatra/base'
class SinatraBase < Sinatra::Base
  post '/*' do
    RequestStore.instance.store(request)
  end
end

require 'singleton'
class RequestStore
  include Singleton

  def store(request)
    @request = request.body.string
  end

  def load
    @request
  end
end