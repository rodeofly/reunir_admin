class GroupeEnfantsController < ApplicationController
  # GET /groupe_enfants
  # GET /groupe_enfants.json
  def index
    @groupe_enfants = GroupeEnfant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groupe_enfants }
    end
  end

  # GET /groupe_enfants/1
  # GET /groupe_enfants/1.json
  def show
    @groupe_enfant = GroupeEnfant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @groupe_enfant }
    end
  end

  # GET /groupe_enfants/new
  # GET /groupe_enfants/new.json
  def new
    @groupe_enfant = GroupeEnfant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @groupe_enfant }
    end
  end

  # GET /groupe_enfants/1/edit
  def edit
    @groupe_enfant = GroupeEnfant.find(params[:id])
  end

  # POST /groupe_enfants
  # POST /groupe_enfants.json
  def create
    @groupe_enfant = GroupeEnfant.new(params[:groupe_enfant])

    respond_to do |format|
      if @groupe_enfant.save
        format.html { redirect_to @groupe_enfant, notice: 'Groupe enfant was successfully created.' }
        format.json { render json: @groupe_enfant, status: :created, location: @groupe_enfant }
      else
        format.html { render action: "new" }
        format.json { render json: @groupe_enfant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groupe_enfants/1
  # PUT /groupe_enfants/1.json
  def update
    @groupe_enfant = GroupeEnfant.find(params[:id])

    respond_to do |format|
      if @groupe_enfant.update_attributes(params[:groupe_enfant])
        format.html { redirect_to @groupe_enfant, notice: 'Groupe enfant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @groupe_enfant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupe_enfants/1
  # DELETE /groupe_enfants/1.json
  def destroy
    @groupe_enfant = GroupeEnfant.find(params[:id])
    @groupe_enfant.destroy

    respond_to do |format|
      format.html { redirect_to groupe_enfants_url }
      format.json { head :no_content }
    end
  end
end
