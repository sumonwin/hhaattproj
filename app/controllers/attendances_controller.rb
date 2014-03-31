require "users_controller"
require "timetables_controller"
require "travelfees_controller"

class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = @timetables = Attendance.paginate(:page=>params[:page],:per_page=>5).find(:all,:conditions=>[" userid  LIKE? ", "%#{params[:userid]}%"])
     @users = User.all
     @travelfees = Travelfee.all
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
    # @travelclass = Travelfee.where(userid:@attendance.userid , date:@attendance.date)
    # get one record from travelfee to enter @t
    
  

    #@w = @attendance.date.wday
    #if (@w == 0)
    # @var = "sunday"
    # elsif (@w == 1)
    #   @var = "monday"
    #elsif (@w == 2)
    #   @var = "tuesday"
    # elsif (@w == 3)
    #   @var = "wednesday"
    # elsif (@w == 4)
    #   @var = "thursday"
    # elsif (@w == 5)
    #   @var = "friday"
    # else @var = "saturaday"
    # end

       
      #@t = Timetable.where(classname:@travel[0][:classname],@var => true)
    
     
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
