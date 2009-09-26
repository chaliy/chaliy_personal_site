xml.instruct! :xml, :version => "1.0"
xml.rss :version => '2.0' do
  xml.channel do
    
    xml.link "http://chaliy.name/"
    xml.title "Mike Chaliy, Blog"
    
    for entry in @entries
      
      xml.item do
        xml.title entry.title
        xml.description entry.description
        xml.pubDate entry.published_on.to_s(:rfc822)
        xml.guid blog_pretty_entry_url(entry)
      end
      
    end
  
  end
  
end
