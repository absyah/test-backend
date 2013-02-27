require 'test_helper'
include MessageFetch
class MessageFecthTest < ActiveSupport::TestCase
  test "fetch message" do
    messages = MessageFetch.get_messages_from_services(SERVICE_URL)
    
    if messages.class == Array
      puts "Success Fetch Data"
      assert_equal messages.size, 2
    else
      puts "Not Success Fetch Data"
      assert_equal messages.nil?, true
    end
  end
end