# encoding: UTF-8
module ProfilsHelper

  def mesure_linechart_data
    mesure_list = []
    taille = 0
    poids = 0
    taille = 0
    poids = 0
    tour_de_taille = 0
    tour_de_hanches = 0
    z_score = 0
    imc = 0
    
    @profil.profil_mesures.each do |mesure|
      taille = mesure.taille? ? taille : mesure.taille
      poids = mesure.poids? ? poids : mesure.poids
      tour_de_taille = mesure.tour_de_taille? ? tour_de_taille : mesure.tour_de_taille
      tour_de_hanches = mesure.tour_de_hanches? ? tour_de_hanches : mesure.tour_de_hanches
      z_score = mesure.z_score? ? z_score : mesure.z_score
      imc = mesure.imc? ? imc : mesure.imc
      puts "*************************"
      puts distance_of_time_in_words(@profil.birthdate,mesure.date_of_mesure,  {:locale => 'fr', :only => ["months", "years"]})
      puts "*************************" 
      mesure_list << [distance_of_time_in_words(@profil.birthdate,mesure.date_of_mesure, {:locale => 'fr', :only => ["months", "years"]}), taille, poids, tour_de_taille, tour_de_hanches, z_score, imc ]
    end
    return mesure_list
  end
  
  def render_csv
    header = [:nom,
              :age,
              :ecole,
              :classe,
              :redoublement,
              :code_postal,
              :educateur,
              :groupe,
              :situation_des_parents,
              :enfant_unique,
              :fratrie_en_surpoids,
              :effectif_foyer,
              :logement,
              :television,
              :ordinateur,
              :internet,
              :corticoide,
              :antihistaminique,
              :antiepileptique,
              :antecedent_pere,
              :antecedent_mere,
              :antecedent_grands_parents,
              :taille_de_naissance,
              :poids_de_naissance,
              :prematurite,
              :allaitement,
              :age_obesite,
              :profession_pere,
              :profession_mere,
              :obesite_pere,
              :obesite_mere,
              ]
    lines= [header]
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
          profession_pere = !tuteur.profession? ? tuteur.profession : "none"
          obesite_pere = !tuteur.tuteur_mesures? ? !tuteur.tuteur_mesures.last.degre_obesite? ? tuteur.tuteur_mesures.last.degre_obesite : "none" : "none"
        end
        if tuteur.tuteur_type=="Mère"
          profession_mere = !tuteur.profession? ? tuteur.profession : "none"
          obesite_mere = !tuteur.tuteur_mesures? ? !tuteur.tuteur_mesures.last.degre_obesite? ? tuteur.tuteur_mesures.last.degre_obesite : "none" : "none"
        end
      end
      lines << [profil.name,
              profil.age,
              profil.school.presence ? profil.school.name : "none",
              profil.classroom? ? profil.classroom : "none",
              profil.redoublement,
              profil.addresses.presence ? profil.addresses.first.zip.zipcode : "none",
              profil.user.presence ? profil.user.name : "none",
              profil.groupe_enfant.presence ? profil.groupe_enfant.name : "none",
              profil.situation_maritale_des_parents? ? profil.situation_maritale_des_parents : "none",
              !profil.fratrie? ? "enfant_unique" : "none",
              profil.fratrie_en_surpoids ? "fratrie_en_surpoids" : "none",
              profil.habitant_du_foyer? ? profil.habitant_du_foyer>4 ? "Foyer>4" : "Foyer<=4" : "none",
              !profil.type_de_logement? ? profil.type_de_logement : "none",
              !profil.television? ? profil.television>2 ? "Télé>2" : "Télé<=2" : "none",
              !profil.ordinateur? ? profil.television>2 ? "Ordi>2" : "Ordi<=2" : "none",
              profil.internet,
              !profil.corticoide? ? profil.corticoide : "none",
              !profil.antihistaminique? ? profil.antihistaminique : "none",
              !profil.antiepileptique? ? profil.antiepileptique : "none",
              !antecedent_pere.blank? ? antecedent_pere.join("/") : "none" ,
              !antecedent_mere.blank? ? antecedent_mere.join("/") : "none" ,
              !antecedent_grands_parents.blank? ? antecedent_grands_parents.join("/") : "none" ,
              !profil.taille_naissance? ? taille_naissance<46 ? "taille_naissance<46cm" : taille_naissance>54 ? "taille_naissance>54cm" : "46cm>taille_naissance>54cm" : "none",
              !profil.poids_naissance? ? poids_naissance<2.6 ? "poids_de_naissance<2.6Kg" : poids_naissance>4.3 ? "poids_de_naissance>4.3Kg" : "2.6Kg>poids_de_naissance>4.3Kg" : "none",
              !profil.terme_sa? ? terme_sa<37 ? "prematurité" : "none" : "none",
              profil.allaitement,
              !profil.age_obesite? ? profil.age_obesite : "none",
              profession_pere,
              profession_mere,
              obesite_pere,
              obesite_mere,
              ] 
    end
    lines 
  end
end