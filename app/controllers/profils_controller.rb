# encoding: UTF-8
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
  
    # GET /profils/datamining
  # GET /profils/datamining.csv
  def datamining
    @profils = Profil.all
    headers = [:nom, :genre, :age, :ecole, :classe, :redoublement, :code_postal, :educateur, :groupe, :situation_des_parents,
              :enfant_unique, :fratrie_en_surpoids, :effectif_foyer, :logement, :television, :ordinateur, :internet,
              :corticoide, :antihistaminique, :antiepileptique, :antecedent_pere, :antecedent_mere, :antecedent_grands_parents,
              :taille_de_naissance, :poids_de_naissance, :prematurite, :allaitement, :age_obesite, :profession_pere,
              :profession_mere, :obesite_pere, :obesite_mere,
              ]
    @lines= [headers]
    @profils = Profil.all
    @profils.each do |profil|
      antecedent_pere = []
      antecedent_mere = []
      antecedent_grands_parents = []
      profil.antecedents.each do |antecedent|
        if antecedent.parent == "Père"
          antecedent_pere << antecedent.antecedent_type
        end
        if antecedent.parent == "Mère"
          antecedent_mere << antecedent.antecedent_type
        end                  
        if antecedent.parent == "Grands-parents"
          antecedent_grands_parents << antecedent.antecedent_type
        end
      end
      profession_pere = ""
      obesite_pere = ""
      profession_mere = ""
      obesite_mere = ""
      
      profil.tuteurs.each do |tuteur|
        if tuteur.tuteur_type=="Père"
          profession_pere = tuteur.profession? ? tuteur.profession : "none"
          obesite_pere = tuteur.tuteur_mesures.presence ? tuteur.tuteur_mesures.last.degre_obesite? ? tuteur.tuteur_mesures.last.degre_obesite : "none" : "none"
        end
        if tuteur.tuteur_type=="Mère"
          profession_mere = tuteur.profession? ? tuteur.profession : "none"
          obesite_mere = tuteur.tuteur_mesures.presence ? tuteur.tuteur_mesures.last.degre_obesite? ? tuteur.tuteur_mesures.last.degre_obesite : "none" : "none"
        end
      end
      @lines << [profil.name,
              profil.gender? ? profil.gender : "none",
              !profil.age.blank? ? profil.age>12 ? "age>12" : "age<12" : "none",
              profil.school.presence ? profil.school.schooltype : "none",
              profil.classroom? ? profil.classroom : "none",
              profil.redoublement,
              profil.addresses.presence ? profil.addresses.first.zip.zipcode : "none",
              profil.user.presence ? profil.user.name : "none",
              profil.groupe_enfant.presence ? profil.groupe_enfant.name : "none",
              profil.situation_maritale_des_parents? ? profil.situation_maritale_des_parents : "none",
              !profil.fratrie? ? "enfant_unique" : "none",
              profil.fratrie_en_surpoids ? "fratrie_en_surpoids" : "none",
              profil.habitant_du_foyer? ? profil.habitant_du_foyer>4 ? "Foyer>4" : "Foyer<=4" : "none",
              profil.type_de_logement? ? profil.type_de_logement : "none",
              profil.television? ? profil.television>2 ? "Télé>2" : "Télé<=2" : "none",
              profil.ordinateur? ? profil.television>2 ? "Ordi>2" : "Ordi<=2" : "none",
              profil.internet? ? "Internet" : "none",
              profil.corticoide? ? profil.corticoide : "none",
              profil.antihistaminique? ? profil.antihistaminique : "none",
              profil.antiepileptique? ? profil.antiepileptique : "none",
              !antecedent_pere.blank? ? antecedent_pere.join("/") : "none" ,
              !antecedent_mere.blank? ? antecedent_mere.join("/") : "none" ,
              !antecedent_grands_parents.blank? ? antecedent_grands_parents.join("/") : "none" ,
              profil.taille_naissance? ? profil.taille_naissance<46 ? "taille_naissance<46cm" : profil.taille_naissance>54 ? "taille_naissance>54cm" : "46cm>taille_naissance>54cm" : "none",
              profil.poids_naissance? ? profil.poids_naissance<2.6 ? "poids_de_naissance<2.6Kg" : profil.poids_naissance>4.3 ? "poids_de_naissance>4.3Kg" : "2.6Kg>poids_de_naissance>4.3Kg" : "none",
              profil.terme_sa? ? profil.terme_sa<37 ? "prematurité" : "none" : "none",
              profil.allaitement? ? "Allaitement" : "none",
              profil.age_obesite? ? profil.age_obesite : "none",
              profession_pere,
              profession_mere,
              obesite_pere,
              obesite_mere,
              ] 
    end
    arules
    respond_to do |format|
      format.html # datamining.html.erb
      format.csv { render :csv => datamining_csv }
      format.json { render json: @profils }
    end
  end
  
  private
  def datamining_csv # convert @revisions to csv: customize to your needs
    CSV.generate(:col_sep => "\t") do |csv|
      @lines.each do |line|            # set the data
        csv << line
      end
    end
  end
  
  DataRow = Struct.new(:var1, :fac1, :res1)

  def arules
    r = Rserve::Simpler.new
    structs = [
      DataRow.new(1,3,4),
      DataRow.new(2,4,5),
      DataRow.new(3,5,6),
      DataRow.new(4,6,7)
    ]
    datafr = Rserve::DataFrame.from_structs(structs)    
   
     
  end
end
