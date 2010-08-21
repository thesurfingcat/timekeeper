class SetDefaultValuesForLogs < ActiveRecord::Migration
  def self.up
    change_column_default :timelogs, :toil, :default => 'N'
    change_column_default :timelogs, :non_working, :default => 'N'
  end

  def self.down
    change_column_default :timelogs, :non_working, :default => nil
    change_column_default :timelogs, :toil, :default => nil
  end
end
