class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.save
    redirect_to(new_message_url)
  end

end
