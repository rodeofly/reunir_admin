class ZipsController < ApplicationController
  # GET /zips
  # GET /zips.json
  def index
    @zips = Zip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zips }
    end
  end

  # GET /zips/1
  # GET /zips/1.json
  def show
    @zip = Zip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zip }
    end
  end

  # GET /zips/new
  # GET /zips/new.json
  def new
    @zip = Zip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zip }
    end
  end

  # GET /zips/1/edit
  def edit
    @zip = Zip.find(params[:id])
  end

  # POST /zips
  # POST /zips.json
  def create
    @zip = Zip.new(params[:zip])

    respond_to do |format|
      if @zip.save
        format.html { redirect_to @zip, notice: 'Zip was successfully created.' }
        format.json { render json: @zip, status: :created, location: @zip }
      else
        format.html { render action: "new" }
        format.json { render json: @zip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zips/1
  # PUT /zips/1.json
  def update
    @zip = Zip.find(params[:id])

    respond_to do |format|
      if @zip.update_attributes(params[:zip])
        format.html { redirect_to @zip, notice: 'Zip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zips/1
  # DELETE /zips/1.json
  def destroy
    @zip = Zip.find(params[:id])
    @zip.destroy

    respond_to do |format|
      format.html { redirect_to zips_url }
      format.json { head :no_content }
    end
  end
end
