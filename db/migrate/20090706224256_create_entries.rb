class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :name
      t.string :title
      t.text :content

      t.timestamps
    end
    
    Entry.create :name => "wellcome", :title => "Wellcome!", :content => "Well, this is just test message!"
    
  end

  def self.down
    drop_table :entries
  end
end
