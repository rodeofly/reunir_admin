# encoding: UTF-8
class QuestionnairesController < ApplicationController
   
  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionnaires }
    end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionnaire }
    end
  end

  # GET /questionnaires/new
  # GET /questionnaires/new.json
  def new
    @questionnaire = Questionnaire.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionnaire }
    end
  end

  # GET /questionnaires/1/edit
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    if !params[:_json].blank?
      params[:_json] = JSON.parse params[:_json] if params[:_json].is_a? String
  
      #Routine de transformation en CSV
      json = params[:_json][0]
      headers = []
      values = []
      csv_string = CSV.generate do |csv|
        json.each do |key, value|
          if (!key.blank? && !value.blank? && value!="Autre")
           #Exclusion de certain champs Limesurvey
            if !['id','Complété','Dernière page vue','Langue de départ', 'FusionQuestion', 'Code'].include?(key)
              #Nettoyage des champs du type "champs [other]"
              if key.include?(" [other]")
                #puts "test [other]"
                key = key.split(" [other]")[0]               
              end
              headers << key
              values << value 
            end
          end
        end
        csv << headers
        csv << values
      end
      
      @questionnaire = Questionnaire.new(params[:questionnaire])
      @questionnaire.content = csv_string
      profil_id, category_id = json['FusionQuestion'].to_s.split("/")
      @questionnaire.profil = Profil.find(id=profil_id)
      @questionnaire.category = Category.find(id=category_id)
    end
      
    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render json: @questionnaire, status: :created, location: @questionnaire }
      else
        format.html { render action: "new" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /questionnaires/1
  # PUT /questionnaires/1.json
  def update
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      if @questionnaire.update_attributes(params[:questionnaire])
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end
end

