class ProfilsController < ApplicationController
  # GET /profils
  # GET /profils.json
  def index
    @profils = Profil.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profils }
    end
  end

  # GET /profils/1
  # GET /profils/1.json
  def show
    @profil = Profil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profil }
    end
  end

  # GET /profils/new
  # GET /profils/new.json
  def new
    @profil = Profil.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profil }
    end
  end

  # GET /profils/1/edit
  def edit
    @profil = Profil.find(params[:id])
  end

  # POST /profils
  # POST /profils.json
  def create
    @profil = Profil.new(params[:profil])

    respond_to do |format|
      if @profil.save
        format.html { redirect_to @profil, notice: 'Profil was successfully created.' }
        format.json { render json: @profil, status: :created, location: @profil }
      else
        format.html { render action: "new" }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profils/1
  # PUT /profils/1.json
  def update
    @profil = Profil.find(params[:id])

    respond_to do |format|
      if @profil.update_attributes(params[:profil])
        format.html { redirect_to @profil, notice: 'Profil was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profils/1
  # DELETE /profils/1.json
  def destroy
    @profil = Profil.find(params[:id])
    @profil.destroy

    respond_to do |format|
      format.html { redirect_to profils_url }
      format.json { head :no_content }
    end
  end
end
