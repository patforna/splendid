require 'spec_helper'

describe MessagesController do
  
  let(:message) { mock_model(Message).as_null_object }
  
  before(:each) do
    Message.stub(:new).and_return(message)
  end

  describe "GET new" do
    it "should assign new message" do
      get :new
      assigns(:message).should be(message)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "should assign new message using the parameters given" do
        Message.should_receive(:new).with("recipient" => "anonymous")
        post :create, :message => { "recipient" => "anonymous" }
        assigns(:message).should be(message)
      end
      
      it "should save message" do
        message.should_receive(:save)
        post :create
      end

      it "should redirect to the created message" do
        post :create
        response.should redirect_to(new_message_url)
      end
      
    end
  end
end
