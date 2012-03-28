class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.date :date_inclusion
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthdate
      t.string :classroom
      t.integer :school_id
      t.integer :medecin_id
      t.integer :user_id
      t.integer :groupe_enfant_id
      t.float   :taille_naissance
      t.float   :poids_naissance
      t.integer :terme_sa
      t.boolean :rciu
      t.boolean :pma
      t.boolean :diabete_gestationnel
      t.string :duree_allaitement
      t.boolean :rebond_ponderal_precoce
      t.integer :age_obesite
      t.string :facteur_declenchant
      t.boolean :prise_en_charge_anterieure
      t.boolean :redoublement
      t.string :situation_maritale_des_parents
      t.integer :fratrie
      t.integer :rang_dans_la_fratrie
      t.integer :fratrie_en_surpoids
      t.integer :habitant_du_foyer
      t.string :type_de_logement
      t.integer :television
      t.integer :ordinateur
      t.boolean :parabole
      t.boolean :internet
      t.string :corticoide
      t.string :antihistaminique
      t.string :antiepileptique
      t.timestamps
    end
  end
end
