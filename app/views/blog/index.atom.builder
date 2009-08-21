xml.feed 'xml:lang' => 'en-US', 'xmlns' => 'http://www.w3.org/2005/Atom' do
  xml.link(:rel => 'alternate', :type => 'text/html', :href => 'http://chaliy.name/blog/')
  xml.link(:rel => 'self', :type => 'application/atom+xml', :href => 'http://chaliy.name/blog.atom')
  xml.title("Mike Chaliy, Blog")
  
  for entry in @entries
    
    xml.entry do
      xml.title(entry.title)
      xml.content(entry.content, :type => 'html')
      xml.published(entry.published_on)
      xml.link(:type => 'text/html', :href => blog_pretty_entry_url(entry))
    end
    
  end
  
end
