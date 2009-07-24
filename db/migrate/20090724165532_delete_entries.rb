class DeleteEntries < ActiveRecord::Migration
  def self.up
    drop_table :entries
  end

  def self.down
    raise IrreversibleMigration 
  end
end
