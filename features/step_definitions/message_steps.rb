Given /^the Message Gateway is up and running$/ do
end

Then /^the message should have been delivered$/ do
  assert FAKE_SERVER.received_request?
end
