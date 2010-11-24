class SetDefaultValuesForLogs < ActiveRecord::Migration
  def self.up
    change_column_default :timelogs, :toil, 'No'
    change_column_default :timelogs, :non_working, 'No'
  end

  def self.down
    change_column_default :timelogs, :non_working, nil
    change_column_default :timelogs, :toil, nil
  end
end
