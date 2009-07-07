class AddPubDateToEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :pubDate, :datetime
  end

  def self.down
    remove_column :entries, :pubDate
  end
end
