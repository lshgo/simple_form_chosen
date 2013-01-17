class DetallsController < ApplicationController
  # GET /detalls
  # GET /detalls.json
  def index
    @detalls = Detall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @detalls }
    end
  end

  # GET /detalls/1
  # GET /detalls/1.json
  def show
    @detall = Detall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @detall }
    end
  end

  # GET /detalls/new
  # GET /detalls/new.json
  def new
    @detall = Detall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detall }
    end
  end

  # GET /detalls/1/edit
  def edit
    @detall = Detall.find(params[:id])
  end

  # POST /detalls
  # POST /detalls.json
  def create
    @detall = Detall.new(params[:detall])

    respond_to do |format|
      if @detall.save
        format.html { redirect_to @detall, notice: 'Detall was successfully created.' }
        format.json { render json: @detall, status: :created, location: @detall }
      else
        format.html { render action: "new" }
        format.json { render json: @detall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /detalls/1
  # PUT /detalls/1.json
  def update
    @detall = Detall.find(params[:id])

    respond_to do |format|
      if @detall.update_attributes(params[:detall])
        format.html { redirect_to @detall, notice: 'Detall was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @detall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalls/1
  # DELETE /detalls/1.json
  def destroy
    @detall = Detall.find(params[:id])
    @detall.destroy

    respond_to do |format|
      format.html { redirect_to detalls_url }
      format.json { head :no_content }
    end
  end

  def search
    @deta = Detall.where(:age => params[:search_param])
    respond_to do |format|
      format.html { render :json => @deta }
      format.json { render :json => @deta }
    end
  end
end
