urlset = Sitemap::Urlset.new
for entry in @published_entries
  urlset.url blog_pretty_entry_url(entry), :lastmod => entry.last_updated_on, :changefreq => "monthly", :priority => 1.0  
end
urlset.url blog_url, :priority => 0.5
for entry in @draft_entries
  urlset.url blog_pretty_entry_url(entry), :changefreq => "monthly", :priority => 0.5 
end
urlset.url blog_drafts_url, :priority => 0.5

xml = urlset.builder