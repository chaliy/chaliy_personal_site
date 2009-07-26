xml = Builder::XmlMarkup.new
xml.instruct!
xml.feed "xml:lang" => "en-US", "xmlns" => 'http://www.w3.org/2005/Atom' do
  xml.link(:rel => 'alternate', :type => 'text/html', :href => 'http://chaliy.name/drafts/')
  xml.link(:rel => 'self', :type => 'application/atom+xml', :href => 'http://chaliy.name/drafts.atom') 
end
