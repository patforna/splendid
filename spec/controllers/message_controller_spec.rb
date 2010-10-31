require 'spec_helper'

describe MessageController do
  it  "should populate the message" do
    post :send
  end
end
