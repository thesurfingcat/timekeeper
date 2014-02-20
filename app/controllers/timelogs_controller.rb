class TimelogsController < ApplicationController
  
  def index
    
    @inlog = false
    @lastlog = Timelog.find(:last)
    if @lastlog.present?
      if @lastlog.endtime == nil or @lastlog.endtime.to_s == '' then
        @inlog = false
      else
        @inlog = true
      end
    else
      @inlog = true
    end
      
    @timelogs = Timelog.find(:all)
    @timelog = Timelog.new
    count = 0
    @average = ''
    avInMins = 0
    hrs=0
    mins=0
    tottime = 0
    toiltime = 0
    nonworktime = 0
    
    if @timelogs != nil and @timelogs.size > 0
      @timelogs.each do |log|
        if log.non_working == 'Yes'
          nonworktime+=log.total
        end
        if log.toil == 'Yes'
          toiltime+=log.extra
        end
        if log.lunchbreak == nil or log.lunchbreak == 0 or log.total == nil
        else
          tottime+=log.total
          count+=1
        end
      end
      tottime = (tottime + nonworktime) - toiltime
      avInMins = tottime/count unless count == 0
      hrs = avInMins/60.floor
      mins = avInMins - (hrs*60)
      @timeup = tottime - (555 * count)
      if @timeup == 0
        @status = "on target"
      elsif @timeup > 0
        @status = "UP"
      elsif @timeup < 0
        @status = "DOWN"
      end
      @average = hrs.to_s + " hours, " + mins.to_s + " minutes. "
    else
      @average = ''
    end
  end

 
  def new
    @timelog = Timelog.new
  end
 
 
  def edit
    @timelog = Timelog.find(params[:id])
  end
 
  def create
    @timelog = Timelog.new(params[:timelog])
    if @timelog.lunchbreak == nil
      @timelog.update_attributes!(:lunchbreak => 30)
    end
    if @timelog.extra == nil
      @timelog.update_attributes!(:extra => 0)
    end
    if @timelog.save
      @log = Timelog.find(@timelog.id)
    end
    redirect_to timelogs_path
  end
 
  def update
    @timelog = Timelog.find(params[:id])
    if @timelog.update_attributes(update_params)
    end
    redirect_to timelogs_path
  end

  def lognonwork
    @timelog = Timelog.new
    if @timelog.save
      @timelog.update_attributes!(:starttime => Time.now, :endtime => Time.now, :extra => 555, :lunchbreak => 0, :total => 0, :non_working => 'Yes', :toil => 'No')
    end
    redirect_to timelogs_path
  end
  
  def logtoil
    @timelog = Timelog.new
    if @timelog.save
      @timelog.update_attributes!(:starttime => Time.now, :endtime => Time.now, :extra => 555, :lunchbreak => 0, :non_working => 'No', :toil => 'Yes', :notes => 'TOIL')
    end
    redirect_to timelogs_path
  end
  
  def login
    @timelog = Timelog.new
    if @timelog.save
      @timelog.update_attributes!(:starttime => Time.now, :extra => 0, :lunchbreak => 30, :non_working => 'No', :toil => 'No')
    end
    redirect_to timelogs_path
  end 
      
  def logout
    @timelog = Timelog.find(Timelog.maximum(:id))
    if @timelog.endtime == nil
      if @timelog.update_attributes!(:endtime => Time.now)
        if @timelog.lunchbreak == nil
          @timelog.update_attributes!(:lunchbreak => 30)
        end
        if @timelog.extra == nil
          @timelog.update_attributes!(:extra => 0)
        end
      end
    end
    redirect_to timelogs_path
  end
  
 
  def destroy
    @timelog = Timelog.find(params[:id])
    @timelog.destroy
    redirect_to timelogs_path
  end
  
  def hide
      @show = has_role?("Power_User")
  end
  
  def user_params
    @timelog = Timelog.find(params[:id])
    params.require(:timelog).permit(:starttime, :endtime, :lunchbreak, :extra, :created_at, :updated_at, :total, :notes, :toil, :non_working)
  end
  
  def update_params
    @timelog = Timelog.find(params[:id])
    # if @timelog.starttime.present? and @timelog.endtime.present? and @timelog.lunchbreak.present? and @timelog.extra.present?
      params.require(:timelog).permit(:starttime, :endtime, :lunchbreak, :extra, :created_at, :updated_at, :total, :notes, :toil, :non_working)
    # else
      # params.require(:timelog).permit(:starttime, :endtime, :lunchbreak, :extra, :created_at, :updated_at, :total, :notes, :toil, :non_working)
    # end
  end

  
end