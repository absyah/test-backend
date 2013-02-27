module MessagesHelper
  # helper to highlighting words "coke, coca-cola, diet cola" 
  def highlight_words(word)
    if word.match(/(([Cc]oca\-|[Dd]iet\ )[Cc]ola|[Cc]oke)/)
      raw word.gsub(/(([Cc]oca\-|[Dd]iet\ )[Cc]ola|[Cc]oke)/, '<span class="red">\1</span>')
    else
      raw word
    end
  end
end