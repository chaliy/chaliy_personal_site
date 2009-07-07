class AddPubDateToEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :pubDate, :dateTime
  end

  def self.down
    remove_column :entries, :pubDate
  end
end
