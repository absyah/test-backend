class Message < ActiveRecord::Base
  # call lib/message_fetch.rb
  include MessageFetch
  
  attr_accessible :id, :followers, :message, :sentiment, :user_handle
  
  # scope to sort messages desc by sentiment 
  scope :by_sentiment, order("sentiment DESC")
  
  # class method to get messages from service "http://adaptive-test-api.herokuapp.com/tweets.json" 
  # then store it into database
  def self.get_messages
    messages = MessageFetch.get_messages_from_services(SERVICE_URL)    
    unless messages.nil?
      self.process_messages(messages)
    else
      all
    end
  end
  
  private 

  # method to check if message is exist in database
  # if exist, add counter to that message but not store into database
  # if no exist, store it into database
  def self.process_messages(messages)
    messages.each do |message|
      find_message = find_by_id(message["id"])
      unless find_message.nil?
        find_message.update_attribute(:count, find_message.count + 1)
      else
        self.save_message(message)
      end
    end
    all
  end
  
  # method to store into database.
  def self.save_message(obj)
    create({
      id: obj["id"],
      followers: obj["followers"],
      message: obj["message"],
      sentiment: obj["sentiment"],
      user_handle: obj["user_handle"],       
      })
  end
end
