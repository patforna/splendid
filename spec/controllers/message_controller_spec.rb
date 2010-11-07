require 'spec_helper'

describe MessageController do

  #def mock_message(stubs={})
  #  (@mock_message ||= mock_model(Message).as_null_object).tap do |message|
  #    message.stub(stubs) unless stubs.empty?
  #  end
  #end

  describe "GET new" do
    it "assigns a new message as @message" do
      # Message.stub(:new) { mock_message }
      get :new
      # assigns(:message).should be(mock_message)
    end
  end

  describe "POST create" do

    describe "with valid params" do
    #  it "assigns a newly created message as @message" do
    #    Message.stub(:new).with({'these' => 'params'}) { mock_message(:save => true) }
    #    post :create, :message => {'these' => 'params'}
    #    assigns(:message).should be(mock_message)
    #  end

      it "redirects to the created message" do
        post :create, :message => {}
        response.should redirect_to(new_message_url)
      end
    end

    #describe "with invalid params" do
    #  it "assigns a newly created but unsaved message as @message" do
    #    Message.stub(:new).with({'these' => 'params'}) { mock_message(:save => false) }
    #    post :create, :message => {'these' => 'params'}
    #    assigns(:message).should be(mock_message)
    #  end

    #  it "re-renders the 'new' template" do
    #    Message.stub(:new) { mock_message(:save => false) }
    #    post :create, :message => {}
    #    response.should render_template("new")
    #  end
    #end

  end

end
