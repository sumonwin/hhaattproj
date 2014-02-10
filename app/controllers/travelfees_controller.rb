class TravelfeesController < ApplicationController
  # GET /travelfees
  # GET /travelfees.json
  def index
    @travelfees = Travelfee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @travelfees }
    end
  end

  # GET /travelfees/1
  # GET /travelfees/1.json
  def show
    @travelfee = Travelfee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @travelfee }
    end
  end

  # GET /travelfees/new
  # GET /travelfees/new.json
  def new
    @travelfee = Travelfee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @travelfee }
    end
  end

  # GET /travelfees/1/edit
  def edit
    @travelfee = Travelfee.find(params[:id])
  end

  # POST /travelfees
  # POST /travelfees.json
  def create
    @travelfee = Travelfee.new(params[:travelfee])

    respond_to do |format|
      if @travelfee.save
        format.html { redirect_to @travelfee, notice: 'Travelfee was successfully created.' }
        format.json { render json: @travelfee, status: :created, location: @travelfee }
      else
        format.html { render action: "new" }
        format.json { render json: @travelfee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /travelfees/1
  # PUT /travelfees/1.json
  def update
    @travelfee = Travelfee.find(params[:id])

    respond_to do |format|
      if @travelfee.update_attributes(params[:travelfee])
        format.html { redirect_to @travelfee, notice: 'Travelfee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @travelfee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travelfees/1
  # DELETE /travelfees/1.json
  def destroy
    @travelfee = Travelfee.find(params[:id])
    @travelfee.destroy

    respond_to do |format|
      format.html { redirect_to travelfees_url }
      format.json { head :no_content }
    end
  end
end
