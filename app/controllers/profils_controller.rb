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
              :enfant_unique,:facteur_declenchant, :fratrie_en_surpoids, :effectif_foyer, :logement, :television, :ordinateur, :internet,
              :corticoide, :antihistaminique, :antiepileptique, :antecedent_pere, :antecedent_mere, :antecedent_grands_parents,
              :taille_de_naissance, :poids_de_naissance, :prematurite, :duree_allaitement, :age_obesite, :profession_pere,
              :profession_mere, :obesite_pere, :obesite_mere
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
              !profil.age.blank? ? profil.age>12 ? "X>12" : "X<12" : "none",
              profil.school.presence ? profil.school.schooltype : "none",
              profil.classroom? ? profil.classroom : "none",
              profil.redoublement ? "oui" : "non",
              profil.addresses.presence ? profil.addresses.first.zip.zipcode : "none",
              profil.user.presence ? profil.user.name : "none",
              profil.groupe_enfant.presence ? profil.groupe_enfant.name : "none",
              profil.situation_maritale_des_parents? ? profil.situation_maritale_des_parents : "none",
              !profil.fratrie? ? "oui" : "non",
              profil.facteur_declenchant? ? profil.facteur_declenchant : "none",
              profil.fratrie_en_surpoids? ? "Oui" : "Non",
              profil.habitant_du_foyer? ? profil.habitant_du_foyer>4 ? "X>4" : "X<=4" : "none",
              profil.type_de_logement? ? profil.type_de_logement : "none",
              profil.television? ? profil.television>2 ? "X>2" : "X<=2" : "none",
              profil.ordinateur? ? profil.television>2 ? "X>2" : "X<=2" : "none",
              profil.internet? ? "Connecté" : "Non Connecté",
              profil.corticoide? ? profil.corticoide : "none",
              profil.antihistaminique? ? profil.antihistaminique : "none",
              profil.antiepileptique? ? profil.antiepileptique : "none",
              !antecedent_pere.blank? ? antecedent_pere.join("/") : "none" ,
              !antecedent_mere.blank? ? antecedent_mere.join("/") : "none" ,
              !antecedent_grands_parents.blank? ? antecedent_grands_parents.join("/") : "none" ,
              profil.taille_naissance? ? profil.taille_naissance<46 ? "X<46cm" : profil.taille_naissance>54 ? "X>54cm" : "46cm>X>54cm" : "none",
              profil.poids_naissance? ? profil.poids_naissance<2.6 ? "X<2.6Kg" : profil.poids_naissance>4.3 ? "X>4.3Kg" : "2.6Kg>X>4.3Kg" : "none",
              profil.prematurite? ? "oui" : "non",
              profil.duree_allaitement? ? profil.duree_allaitement : "non",
              profil.age_obesite? ? profil.age_obesite : "none",
              profession_pere,
              profession_mere,
              obesite_pere,
              obesite_mere,
              ] 
    end
    csv_data = datamining_csv
    arules(csv_data)
    respond_to do |format|
      format.html # datamining.html.erb
      format.csv { render :csv => csv_data }
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
  
  def arules(csv_data,supp=0.25,conf=0.75,minlen=2,maxlen=10)
    CSV.open("tmp/csv/csv_file.csv", "wb") do |csv|
      CSV.parse(csv_data,:col_sep => "\t") do |csv_line|
          csv << csv_line
      end
    end
    hash = {}
    table = CSV.parse(csv_data, col_sep: "\t")
    table.transpose.each do |line|
      hash[line[0]] = line.slice(1..-1)
    end 
    r = Rserve::Simpler.new
    duffy = hash.to_dataframe
    # convert with hash.to_dataframe or Rserve::DataFrame.new(hash)
    r.command('support' => supp, 'confiance' => conf, 'minlength' => minlen, 'maxlength' => maxlen) do
      %Q{
        # supression de l'ensemble du Workspace
        rm(list=ls())
        
        #chargement de la library arules
        library(arules)
        
        #Set working directory
        setwd("/home/florian/workspace/reunir_admin/tmp/csv/")
        #load file as table
        result <- read.table(file="csv_file.csv",header=T,dec=".",sep=",")
        summary(result)

        #transformer les données attributs-variables
        #en données transactionnelles
        result.trans <- as(result,"transactions")
        summary(result.trans)
        
        #extraction des règles
        result.regles <- apriori(result.trans,parameter=list(supp=0.25,conf=0.75,minlen=2,maxlen=10,target="rules"))
        summary(result.regles)
        
        #afficher les 10 premières règles trouvées
        inspect(result.regles[1:10])
        
        #afficher les 5 règles avec le lift le + élevé
        regles.triees <- sort(result.regles,by="lift")
        inspect(regles.triees[1:5])
      }   
    end
    puts "#############################################"
    puts "#############################################"

  end
end
