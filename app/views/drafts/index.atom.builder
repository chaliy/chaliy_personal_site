atom_feed(:url => '/drafts.atom') do |feed|
  feed.title("Address book")
  #feed.updated(@people.first ? @people.first.created_at : Time.now.utc)

  for entry in @entries
    feed.entry(entry) do |feed_entry|
      feed_entry.title(entry.title)
      feed_entry.content(entry.content, :type => 'html')

      #feed_entry.author do |author|
      #  author.name(post.creator.name)
      #  author.email(post.creator.email_address)
      #end
    end
  end
end