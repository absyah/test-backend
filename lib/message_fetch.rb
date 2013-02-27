module MessageFetch
  require 'open-uri'
  
  # get JSON from service
  def self.get_messages_from_services(url)
    begin
      JSON.parse(open(url).read)
    rescue OpenURI::HTTPError
      nil
    end
  end
  
end