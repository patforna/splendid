Then /^the message should have been delivered$/ do
  fake_server = FakeServer.new
  assert fake_server.received_request?
end
