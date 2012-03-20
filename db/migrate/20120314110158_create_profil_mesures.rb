class CreateProfilMesures < ActiveRecord::Migration
  def change
    create_table :profil_mesures do |t|
      t.integer :profil_id
      t.date :date_of_mesure
      t.float :poids
      t.float :taille
      t.integer :tour_de_taille
      t.integer :tour_de_hanches
      t.float :z_score
      t.string :degre_obesite
      t.integer :position
      t.timestamps
    end
  end
end
 