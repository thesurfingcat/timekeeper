class CreateTimelogs < ActiveRecord::Migration
  def self.up
    create_table :timelogs, :force => true do |t|
      t.datetime :starttime
      t.datetime :endtime
      t.integer :lunchbreak
      t.integer :evening
      t.timestamps
    end
  end

  def self.down
    drop_table :timelogs
  end
end
