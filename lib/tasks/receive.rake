namespace :receive do

  # ***********************************************************
  #             Receive updated UCAS records                  *
  # ***********************************************************
  
  desc "UCAS XML-Link - Receive UCAS apps "
  task :apps => :environment do
    begin
      if (Ucasapp.maximum('lastUpdated')) == nil
        @lastupdated = ''
      else
        @lastupdated = (Ucasapp.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      end
      Ucas.new.update_data('apps', @lastupdated, '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "apps", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Receive UCAS choices "
  task :choices => :environment do
    begin
      if (Ucaschoice.maximum('lastUpdated')) == nil
        @lastupdated = ''
      else
        @lastupdated = (Ucaschoice.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      end
      Ucas.new.update_data('choices', @lastupdated, '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "choices", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Process completely withdrawn applications"
  task :cwd => :environment do
    begin
      # if (Ucasapp.maximum('lastUpdated')) == nil
      #               @lastupdated = ''
      #             else
      #               @lastupdated = (Ucasapp.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      #             end
      #       Ucas.new.update_data('cwd', @lastupdated, '', '')
      Ucas.new.update_data('cwd', '', '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "cwd", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Process cancellations"
  task :cancelled => :environment do
    begin
      # if (Ucasapp.maximum('lastUpdated')) == nil
      #   @lastupdated = ''
      # else
      #   @lastupdated = (Ucasapp.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      # end
      # Ucas.new.update_data('cancelled', @lastupdated, '', '')
      Ucas.new.update_data('cancelled', '', '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "cancelled", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Process Reinstated"
  task :reinstated => :environment do
    begin
      # if (Ucasapp.maximum('lastUpdated')) == nil
      #         @lastupdated = ''
      #       else
      #         @lastupdated = (Ucasapp.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      #       end
      #       Ucas.new.update_data('reinstated', @lastupdated, '', '')
      Ucas.new.update_data('reinstated', '', '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "reinstated", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end

  desc "UCAS XML-Link - Get all qualifications"
  task :qualifications => :environment do
    begin
      if (Ucasqualification.maximum('lastUpdated')) == nil
        @lastupdated = ''
      else
        @lastupdated = (Ucasqualification.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      end
      Ucas.new.update_data('qualifications', @lastupdated, '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "qualifications", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Get all education details"
  task :education => :environment do
    begin
      if (Ucaseducation.maximum('lastUpdated')) == nil
        @lastupdated = ''
      else
        @lastupdated = (Ucaseducation.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      end
      Ucas.new.update_data('education', @lastupdated, '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "education", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Get all applicant activities"
  task :activities => :environment do
    begin
      if (Applicantactivity.maximum('lastUpdated')) == nil
        @lastupdated = ''
      else
        @lastupdated = (Applicantactivity.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      end
      Ucas.new.update_data('activities', @lastupdated, '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "activities", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Get all work experience"
  task :workexp => :environment do
    begin
      if (Ucasworkexperience.maximum('lastUpdated')) == nil
        @lastupdated = ''
      else
        @lastupdated = (Ucasworkexperience.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      end
      Ucas.new.update_data('workexp', @lastupdated, '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "workexp", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Get all referees"
  task :referees => :environment do
    begin
      if (Ucasreferee.maximum('lastUpdated')) == nil
        @lastupdated = ''
      else
        @lastupdated = (Ucasreferee.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      end
      Ucas.new.update_data('referees', @lastupdated, '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "referees", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Get all statements"
  task :statements => :environment do
    begin
      if (Ucasstatement.maximum('lastUpdated')) == nil
        @lastupdated = ''
      else
        @lastupdated = (Ucasstatement.maximum('lastUpdated')-7.days).strftime('%d/%m/%Y %H:%M:%S')
      end
      Ucas.new.update_data('statements', @lastupdated, '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "statements", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "** UCAS XML-Link - Bulk Receive everything ** (runs all receive namespace tasks)"
  task :all => [:cwd, :cancelled, :reinstated, :apps, :choices, :qualifications, :education,
                :activities, :workexp, :referees, :statements]
  
  # ***************************************
  #   Receive all data in the XML dataset
  # ***************************************
  
  desc "UCAS XML-Link - Receive ALL apps in the current cycle"
  task :totalapps => :environment do
    begin
      Ucas.new.update_data('apps', '', '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "apps", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
  desc "UCAS XML-Link - Receive ALL choices in the current cycle"
  task :totalchoices => :environment do
    begin
      Ucas.new.update_data('choices', '', '', '')
    rescue Exception => exc
      Receivelog.create(:entity => "choices", :successful => 'FAIL', :message => exc.message, :timestarted => @timestarted, :timefinished => @timefinished)
    end # rescue
  end
  
end