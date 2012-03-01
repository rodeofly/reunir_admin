class CreateMesures < ActiveRecord::Migration
  def change
    create_table :mesures do |t|
      t.date :date_of_mesure
      t.float :poids
      t.float :taille
      t.integer :tour_de_taille
      t.integer :tour_de_hanches
      t.float :z_score
      t.string :degre_obesite
      t.references :mesurable, :polymorphic => true
      t.timestamps
    end
  end
end
