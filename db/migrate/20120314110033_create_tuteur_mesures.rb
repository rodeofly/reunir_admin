class CreateTuteurMesures < ActiveRecord::Migration
  def change
    create_table :tuteur_mesures do |t|
      t.integer :tuteur_id
      t.date :date_of_mesure
      t.float :poids
      t.float :taille
      t.integer :tour_de_taille
      t.integer :tour_de_hanches
      t.float :z_score
      t.string :degre_obesite
      t.timestamps
    end
  end
end