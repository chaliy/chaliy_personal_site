module ApplicationHelper
  def blog_syndication_url
    "http://feeds.feedburner.com/chaliy"
  end
  
  def blog_pretty_entry_url(e)
    blog_entry_url(:name => e.name, :year => e.published_on.year, :month => e.published_on.month)
  end
end