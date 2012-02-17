class MedecinsController < ApplicationController
  # GET /medecins
  # GET /medecins.json
  def index
    @medecins = Medecin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medecins }
    end
  end

  # GET /medecins/1
  # GET /medecins/1.json
  def show
    @medecin = Medecin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medecin }
    end
  end

  # GET /medecins/new
  # GET /medecins/new.json
  def new
    @medecin = Medecin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medecin }
    end
  end

  # GET /medecins/1/edit
  def edit
    @medecin = Medecin.find(params[:id])
  end

  # POST /medecins
  # POST /medecins.json
  def create
    @medecin = Medecin.new(params[:medecin])

    respond_to do |format|
      if @medecin.save
        format.html { redirect_to @medecin, notice: 'Medecin was successfully created.' }
        format.json { render json: @medecin, status: :created, location: @medecin }
      else
        format.html { render action: "new" }
        format.json { render json: @medecin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medecins/1
  # PUT /medecins/1.json
  def update
    @medecin = Medecin.find(params[:id])

    respond_to do |format|
      if @medecin.update_attributes(params[:medecin])
        format.html { redirect_to @medecin, notice: 'Medecin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medecin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medecins/1
  # DELETE /medecins/1.json
  def destroy
    @medecin = Medecin.find(params[:id])
    @medecin.destroy

    respond_to do |format|
      format.html { redirect_to medecins_url }
      format.json { head :no_content }
    end
  end
end
