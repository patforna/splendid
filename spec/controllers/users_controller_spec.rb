require 'spec_helper'

describe UsersController do
  
  let(:user) { mock_model(User).as_null_object }
  
  before(:each) do
    User.stub(:new).and_return(user)
  end

  describe "GET new" do
    it "should assign new user" do
      get :new
      assigns(:user).should be(user)
    end
  end

  describe "POST create" do

      it "should assign new user using the parameters given" do
        User.should_receive(:new).with("username" => "patforna", "userkey" => "foobar")
        post :create, :user => { "username" => "patforna", "userkey" => "foobar" }
        assigns(:user).should be(user)
      end
      
      it "should save user" do
        user.should_receive(:save)
        post :create
      end

      it "should redirect to the new message page" do
        post :create
        response.should redirect_to(new_message_url)
      end
      
  end
end
