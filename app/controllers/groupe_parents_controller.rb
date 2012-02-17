class GroupeParentsController < ApplicationController
  # GET /groupe_parents
  # GET /groupe_parents.json
  def index
    @groupe_parents = GroupeParent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groupe_parents }
    end
  end

  # GET /groupe_parents/1
  # GET /groupe_parents/1.json
  def show
    @groupe_parent = GroupeParent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @groupe_parent }
    end
  end

  # GET /groupe_parents/new
  # GET /groupe_parents/new.json
  def new
    @groupe_parent = GroupeParent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @groupe_parent }
    end
  end

  # GET /groupe_parents/1/edit
  def edit
    @groupe_parent = GroupeParent.find(params[:id])
  end

  # POST /groupe_parents
  # POST /groupe_parents.json
  def create
    @groupe_parent = GroupeParent.new(params[:groupe_parent])

    respond_to do |format|
      if @groupe_parent.save
        format.html { redirect_to @groupe_parent, notice: 'Groupe parent was successfully created.' }
        format.json { render json: @groupe_parent, status: :created, location: @groupe_parent }
      else
        format.html { render action: "new" }
        format.json { render json: @groupe_parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groupe_parents/1
  # PUT /groupe_parents/1.json
  def update
    @groupe_parent = GroupeParent.find(params[:id])

    respond_to do |format|
      if @groupe_parent.update_attributes(params[:groupe_parent])
        format.html { redirect_to @groupe_parent, notice: 'Groupe parent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @groupe_parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupe_parents/1
  # DELETE /groupe_parents/1.json
  def destroy
    @groupe_parent = GroupeParent.find(params[:id])
    @groupe_parent.destroy

    respond_to do |format|
      format.html { redirect_to groupe_parents_url }
      format.json { head :no_content }
    end
  end
end
