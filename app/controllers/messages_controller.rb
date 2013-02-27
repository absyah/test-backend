class MessagesController < ApplicationController
  def index
    # show all messages ordered DESC by sentiment
    @messages = Message.by_sentiment.all
  end
  
  def fetch_message
    @messages = Message.get_messages
    render :index
  end
  
end
