urlset = Sitemap::Urlset.new
urlset.url blog_url, :changefreq => "daily", :priority => 1.0
for entry in @published_entries
  urlset.url blog_pretty_entry_url(entry), :lastmod => entry.published_on, :changefreq => "never", :priority => 1.0  
end
urlset.url blog_drafts_url, :changefreq => "daily"
for entry in @draft_entries
  urlset.url blog_pretty_entry_url(entry), :changefreq => "never"  
end

xml = urlset.builder