class Timelog < ActiveRecord::Base
  
  after_save :update_totals
  
  def update_totals
    total = self.total
    if self.endtime.present? and self.starttime.present? and self.lunchbreak.present? and self.extra.present?
      self.total = (((self.endtime - self.starttime)/60) - self.lunchbreak + self.extra)
    end
    if self.total != total
      self.save
    end
  end
   
end