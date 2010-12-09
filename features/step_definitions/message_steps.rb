Given /^the Message Gateway is up and running$/ do
  WebMock.allow_net_connect!
  @fake_server = FakeServer.new
end

Then /^the message should have been delivered$/ do
  assert @fake_server.received_request?
end
