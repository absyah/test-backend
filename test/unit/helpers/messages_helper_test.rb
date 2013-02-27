require 'test_helper'

class MessagesHelperTest < ActionView::TestCase
  test "highlight_words coke" do
    word = "coke fresh"
    word =  highlight_words word
    assert_equal word, '<span class="red">coke</span> fresh'
  end

  test "highlight_words coca-cola" do
    word = "coca-cola cool man"
    word =  highlight_words word
    assert_equal word, '<span class="red">coca-cola</span> cool man'
  end
  
  test "highlight_words diet cola" do
    word = "i want to diet cola"
    word =  highlight_words word
    assert_equal word, 'i want to <span class="red">diet cola</span>'
  end
  
  test "highlight_words false" do
    word = "fresh day"
    word =  highlight_words word
    assert_equal word, 'fresh day'
  end  
end
