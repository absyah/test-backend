require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "get message nil value" do
    Message.destroy_all
    message = Message.get_messages(nil)
    assert_equal message.blank?, true
  end
  
  test "get message with value" do
    Message.destroy_all
    json_data = [
      {"created_at"=>"2012-09-27T16:11:15Z", 
       "followers"=>24, 
       "id"=>3, 
       "message"=>"Coke is it!", 
       "sentiment"=>1.0, 
       "updated_at"=>"2012-09-27T16:11:15Z", 
       "user_handle"=>"@coke_snortr"}, 
      {"created_at"=>"2012-09-27T16:18:50Z", 
       "followers"=>245, 
       "id"=>14, 
       "message"=>"Coke coke coke coke coke!!!!", 
       "sentiment"=>0.4, 
       "updated_at"=>"2012-09-27T16:18:50Z", 
       "user_handle"=>"@coke_snortr"
      }      
     ]    
    message = Message.get_messages(json_data)
    assert_equal message.blank?, false
  end
  
  test "process messages" do
    Message.destroy_all
    json_data = [
      {"created_at"=>"2012-09-27T16:11:15Z", 
       "followers"=>24, 
       "id"=>3, 
       "message"=>"Coke is it!", 
       "sentiment"=>1.0, 
       "updated_at"=>"2012-09-27T16:11:15Z", 
       "user_handle"=>"@coke_snortr"}, 
      {"created_at"=>"2012-09-27T16:18:50Z", 
       "followers"=>245, 
       "id"=>14, 
       "message"=>"Coke coke coke coke coke!!!!", 
       "sentiment"=>0.4, 
       "updated_at"=>"2012-09-27T16:18:50Z", 
       "user_handle"=>"@coke_snortr"
      }      
     ]
    messages = Message.process_messages(json_data)
    assert_equal messages.blank?, false
  end
  
  test "process messages with same value" do
    Message.destroy_all
    json_data = [
      {"created_at"=>"2012-09-27T16:11:15Z", 
       "followers"=>24, 
       "id"=>3, 
       "message"=>"Coke is it!", 
       "sentiment"=>1.0, 
       "updated_at"=>"2012-09-27T16:11:15Z", 
       "user_handle"=>"@coke_snortr"       
       }     
      ]
   
    messages = Message.process_messages(json_data)
    assert_equal messages.first.count, 0
    
    messages = Message.process_messages(json_data)
    assert_equal messages.first.count, 1
  end  
  
  test "save message" do
    Message.destroy_all
    json = {"created_at"=>"2012-09-27T16:11:15Z", 
       "followers"=>24, 
       "id"=>3, 
       "message"=>"Coke is it!", 
       "sentiment"=>1.0, 
       "updated_at"=>"2012-09-27T16:11:15Z", 
       "user_handle"=>"@coke_snortr"       
     }
     
    Message.save_message(json)
    assert_equal Message.first.message, "Coke is it!"
  end
  
  
  
end
