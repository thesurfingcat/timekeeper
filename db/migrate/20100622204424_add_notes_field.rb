class AddNotesField < ActiveRecord::Migration
  def self.up
    add_column :timelogs, :notes, :string
  end

  def self.down
    remove_column :timelogs, :notes
  end
end
