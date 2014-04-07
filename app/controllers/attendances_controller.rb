require "users_controller"
require "timetables_controller"
require "travelfees_controller"

class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json
  def index

    
     if (params["date"] != nil)

      
         if (params["month"].to_i == 1)
           @month1 = 12
           @year1  = (params["date"]["grandyear"].to_i)-1

         else
           @month1 = (params["month"].to_i())-1
           @year1= params["date"]["grandyear"]
           
         end
           @year2= params["date"]["grandyear"]
     end
      @month2 = params["month"]
      @date2 = @year2.to_s()+"-"+ @month2.to_s()+"-25"
      @date1 = @year1.to_s()+"-"+@month1.to_s()+"-26"
     
     if((Date.today.month).to_i == 1)
       @previousmonth = 12
       @previousyear = ((Date.today.year).to_i)-1

     else
        @previousmonth = ((Date.today.month).to_i)-1
        @previousyear = Date.today.year
       
     end
        @currentmonth = Date.today.month
        @currentyear  = Date.today.year
        @currentdate = @currentyear.to_s()+'-'+ @currentmonth.to_s()+"-25"
        @previousdate =  @previousyear.to_s()+'-'+ @previousmonth .to_s()+"-26"

     

     if(params["date"] == nil)
       @attendances  = Attendance.paginate(:page=>params[:page],:per_page=>5).find(:all,:conditions=>[" userid  LIKE?", "%#{params[:useridd]}%" ])
       @attend   = Attendance.paginate(:page=>params[:page],:per_page=>5).find(:all,:conditions=>[" date BETWEEN ? AND ? ", @previousdate , @currentdate ], :select => 'DISTINCT userid')
       @query = Attendance.find(:all,:conditions=>[" date BETWEEN ? AND ? ", @previousdate , @currentdate ], :select => 'DISTINCT userid,date')
       @travel = Travelfee.find(:all,:conditions=>[" date BETWEEN ? AND ? ", @previousdate , @currentdate ], :select => 'DISTINCT userid,date,travel_fee')
     else
       @attendances  = Attendance.paginate(:page=>params[:page],:per_page=>5).find(:all,:conditions=>["userid  LIKE? AND date BETWEEN ? AND ? ", "%#{params[:useridd]}%" , @date1 , @date2  ])
       @attend   = Attendance.find(:all,:conditions=>["userid  LIKE? AND date BETWEEN ? AND ? ","%#{params[:useridd]}%", @date1 , @date2 ], :select => 'DISTINCT userid')
       @query = Attendance.find(:all,:conditions=>["userid  LIKE? AND  date BETWEEN ? AND ? ", "%#{params[:useridd]}%", @date1 , @date2 ], :select => 'DISTINCT userid,date')
       @travel = Travelfee.find(:all,:conditions=>[" date BETWEEN ? AND ? ", @date1 , @date2 ], :select => 'DISTINCT userid,date,travel_fee')
     end  


   
     @users = User.all
     @travelfees = Travelfee.all
     #@m = month
     #@travelclass = Travelfee.where(userid:@attendance.userid , date:@attendance.date)
     @timetables = Timetable.all
     @attcount = Attendance.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
    
  end

  # GET /attendances/1   :all,:conditions=>[" userid  LIKE?  ", "%#{params[:userid]}%"]
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])
    @attcount = Attendance.all
    @travelfees = Travelfee.all
    @timetables = Timetable.all

     #@time = Timetable.where(classname:@t.classname)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new
    @users = User.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit 
  def edit
    @attendance = Attendance.find(params[:id])
    @users = User.all
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])
    @users = User.all
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])
     @users = User.all
    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :no_content }
    end
  end
  
  
 end
