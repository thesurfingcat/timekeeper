class TimelogsController < ApplicationController
  
  def index
    
    @inlog = false
    @lastlog = Timelog.find(:last)
    if @lastlog.endtime == nil or @lastlog.endtime.to_s == '' then
      @inlog = false
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
    if @timelogs != nil and @timelogs.size > 0
      @timelogs.each do |log|
        if log.lunchbreak == nil or log.lunchbreak == 0
        else
          tottime+=log.total
          count+=1
        end
      end
      avInMins = tottime/count
      hrs = avInMins/60.floor
      mins = avInMins - (hrs*60)
      balance = avInMins - 555
      if balance == 0
        @status = " - on target. "
      elsif balance > 0
        @status = "UP"
      elsif balance < 0
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
    
 
    respond_to do |format|
      if @timelog.save
        flash[:notice] = 'Time logged successfully.'
        @log = Timelog.find(@timelog.id)
        if @log.endtime != nil && @log.lunchbreak != nil && @log.evening != nil
          @timelog.update_attributes(params[:timelog].merge(:total => ((@timelog.endtime - @timelog.starttime)/60) - @timelog.lunchbreak + @timelog.evening))
        end
        format.html { redirect_to(timelogs_path) }
        format.xml { render :xml => @timelog, :status => :created, :location => @timelog }
      else
        format.html { render :action => "index" }
        format.xml { render :xml => @timelog.errors, :status => :unprocessable_entity }
        @timelogs = Timelog.all
      end
    end
  end
 
  def update
    @timelog = Timelog.find(params[:id])
 
    respond_to do |format|
      if @timelog.update_attributes(params[:timelog])
        flash[:notice] = 'Time log updated successfully.'
        @timelog = Timelog.find(params[:id])
        if @timelog.endtime != nil && @timelog.lunchbreak != nil && @timelog.evening != nil
          @timelog.update_attributes(params[:timelog].merge(:total => ((@timelog.endtime - @timelog.starttime)/60) - @timelog.lunchbreak + @timelog.evening))
        end
        format.html { redirect_to(timelogs_path) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @timelog.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def login
    @timelog = Timelog.new
    respond_to do |format|
      if @timelog.save
        @timelog.update_attributes!(:starttime => Time.now)
        flash[:notice] = 'Logged In successfully.'
        format.html { redirect_to(timelogs_path) }
        format.xml { head :ok }
      else
        format.html { render :action => "index" }
        format.xml { render :xml => @timelog.errors, :status => :unprocessable_entity }
        @timelogs = Timelog.all
      end
     end
    end
      
      
  def logout
    @timelog = Timelog.find(Timelog.maximum(:id))
    if @timelog.endtime == nil
      respond_to do |format|
        if @timelog.update_attributes!(:endtime => Time.now)
          if @timelog.lunchbreak == nil
            @timelog.update_attributes!(:lunchbreak => 30)
          end
          if @timelog.evening == nil
            @timelog.update_attributes!(:evening => 0)
          end
          @timelog.update_attributes!(:total => ((@timelog.endtime - @timelog.starttime)/60) - @timelog.lunchbreak + @timelog.evening)

          flash[:notice] = 'Logged Out successfully.'
          format.html { redirect_to(timelogs_path) }
          format.xml { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml { render :xml => @timelog.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        flash[:notice] = 'Already Logged Out.'
        format.html { redirect_to(timelogs_path) }
      end
    end
  end
  
 
  def destroy
    @timelog = Timelog.find(params[:id])
    @timelog.destroy
    flash[:notice] = 'Time log removed successfully.'
 
    respond_to do |format|
      format.html { redirect_to(timelogs_path) }
      format.xml { head :ok }
    end
  end
  
  def hide
      @show = has_role?("Power_User")
  end
end