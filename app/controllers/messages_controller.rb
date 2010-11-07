class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    puts "***************"
    puts @message.to_s
    puts "***************"
    redirect_to(new_message_url)
  end

end
