class AddFieldsForToil < ActiveRecord::Migration
  def self.up
    add_column :timelogs, :toil, :string
    add_column :timelogs, :non_working, :string
    rename_column :timelogs, :evening, :extra
  end

  def self.down
    rename_column :timelogs, :extra, :evening
    remove_column :timelogs, :non_working
    remove_column :timelogs, :toil
  end
end
