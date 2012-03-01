class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
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
      t.boolean :allaitement
      t.integer :duree_allaitement
      t.boolean :rebond_ponderal_precoce
      t.integer :age_obesite
      t.boolean :facteur_declenchant
      t.boolean :prise_en_charge_anterieure
      t.timestamps
    end
  end
end
