Given /^the Message Gateway is up and running$/ do
  require File.expand_path(File.dirname(__FILE__) + '/../../config/fake_server')
  @fake_server = FakeServer.new
end

Then /^the message should have been delivered$/ do
  assert @fake_server.received_request?
end
