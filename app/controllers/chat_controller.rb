class ChatController < ApplicationController
  before action: authenticate!

  # display last 20 messages
  def show
    @messages = Message.order(created_at: :asc).last(20)
  end

  private
  
  # redirect user to /login if he hasn't picked a username yet
  def authenticate!
    redirect_to login login_path unless session[:username]
  end

end
