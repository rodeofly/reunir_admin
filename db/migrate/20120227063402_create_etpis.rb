class CreateEtpis < ActiveRecord::Migration
  def change
    create_table :etpis do |t|
      t.integer :profil_id
      t.references :etpiable, :polymorphic => true
      
      t.date :etpi_date
      t.string :relation_avec_les_camarades
      #Activités diverses de l'enfant
      t.string :activite_physique_a_l_ecole
      t.string :activite_physique_en_club
      t.string :activite_physique_a_la_maison
      t.string :mode_du_trajet_ecole_maison
      t.string :activite_sedentaire_devant_l_ordinateur
      t.string :activite_sedentaire_devant_la_television
      t.string :activite_physique_des_parents
      t.string :activite_artistique
      t.time :heure_du_lever_en_periode_scolaire
      t.time :heure_du_coucher_en_periode_scolaire
      t.time :heure_du_lever_en_vacances
      t.time :heure_du_coucher_en_vacances
      #Habitudes alimentaires
      t.boolean :petit_dejeuner_boisson
      t.boolean :petit_dejeuner_produit_laitier
      t.boolean :petit_dejeuner_feculent
      t.boolean :petit_dejeuner_fruit_legume
      t.boolean :petit_dejeuner_vpo
      t.boolean :petit_dejeuner_matiere_grasse
      t.boolean :petit_dejeuner_produit_gras_sucre
      t.boolean :collation_boisson
      t.boolean :collation_produit_laitier
      t.boolean :collation_feculent
      t.boolean :collation_fruit_legume
      t.boolean :collation_vpo
      t.boolean :collation_matiere_grasse
      t.boolean :collation_produit_gras_sucre
      t.boolean :dejeuner_boisson
      t.boolean :dejeuner_produit_laitier
      t.boolean :dejeuner_feculent
      t.boolean :dejeuner_fruit_legume
      t.boolean :dejeuner_vpo
      t.boolean :dejeuner_matiere_grasse
      t.boolean :dejeuner_produit_gras_sucre
      t.boolean :gouter_boisson
      t.boolean :gouter_produit_laitier
      t.boolean :gouter_feculent
      t.boolean :gouter_fruit_legume
      t.boolean :gouter_vpo
      t.boolean :gouter_matiere_grasse
      t.boolean :gouter_produit_gras_sucre
      t.boolean :diner_boisson
      t.boolean :diner_produit_laitier
      t.boolean :diner_feculent
      t.boolean :diner_fruit_legume
      t.boolean :diner_vpo
      t.boolean :diner_matiere_grasse
      t.boolean :diner_produit_gras_sucre
      t.string :consommation_de_fruit
      t.string :consommation_de_legume
      t.string :consommation_de_soda
      t.string :grignotage
      t.string :contexte_des_repas
      t.string :demande_a_se_resservir
      t.string :se_ressert
      t.string :rythme_d_ingestion
      t.string :representation_des_repas_selon_l_enfant
      t.string :representation_des_repas_selon_les_parents
      t.boolean :autodetermination_du_seuil_de_satiete
      #Comportement psychologique
      t.boolean :trouble_psychologique
      t.boolean :prise_en_charge_psychologique
      t.boolean :probleme_relationnel
      t.boolean :trouble_du_comportement_alimentaire
      #Diagnostique éducatif de l'éducatrice en ETP
      t.boolean :manque_d_activite_physique
      t.boolean :temps_d_ecran_excessif
      t.boolean :grignotages
      t.boolean :consommation_de_soda_importante
      t.boolean :alimentation_trop_riche
      t.boolean :carence_en_fruit_et_legume
      t.boolean :composition_des_repas_a_revoir
      t.boolean :contexte_des_repas_inadequate
      t.boolean :mauvaise_repartition_des_repas
      t.string :autre_diagnostique
      t.string :motivation_de_la_famille
      t.string :motivation_de_l_enfant
      t.date :date_prochain_etpi
      t.timestamps
    end
  end
end
