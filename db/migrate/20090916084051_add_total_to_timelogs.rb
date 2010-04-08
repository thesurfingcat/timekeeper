class AddTotalToTimelogs < ActiveRecord::Migration
  def self.up
    add_column :timelogs, :total, :integer
  end

  def self.down
    remove_column :timelogs, :total
  end
end
