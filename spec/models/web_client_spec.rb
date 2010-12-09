require 'spec_helper'

describe WebClient do

  # FIXME use config
  # DESTINATION = "http://xml1.aspsms.com/xmlsvr.asp"
  DESTINATION = "http://localhost:9090/xmlsvr.asp"

  before(:each) do
    stub_request(:any, /.*/)
    @client = WebClient.new
  end

  describe "Post" do
    it "should POST content to destination" do
      @client.post "<foo/>"
      WebMock.should have_requested(:post, DESTINATION).with(:body => "<foo/>")
    end
        
    it "should set the content type to text/xml" do
      @client.post :something
      WebMock.should have_requested(:post, DESTINATION).with(:headers => {'Content-Type' => 'text/xml'})
    end
    
    it "should set the content length" do
      @client.post "this string is 33 characters long"
      WebMock.should have_requested(:post, DESTINATION).with(:headers => {'Content-Length' => 33})
    end    
    
    it "should blow up if non successfull response" do
      stub_request(:any, /.*/).to_return(:status => 500)
      expect{ @client.post(:something) }.to raise_error
    end
    
  end

end
