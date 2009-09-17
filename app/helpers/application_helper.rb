module ApplicationHelper
  def blog_syndication_url
    "http://feeds.feedburner.com/chaliy"
  end
  
  def blog_pretty_entry_url(e)
    blog_entry_url(:name => e.name, :year => e.published_on.year, :month => e.published_on.month)
  end
  
  def time_ago_in_words(d)
    
    from_time = d.to_time if d.respond_to?(:to_time)
    to_time = Time.now 
    
    distance_in_minutes = (((to_time - from_time).abs)/60).round
    
    if distance_in_minutes > 525599
      return "on "+ d.to_formatted_s;
    else
      return distance_of_time_in_words(from_time, to_time) + " ago";
    end
    
    
  end
end