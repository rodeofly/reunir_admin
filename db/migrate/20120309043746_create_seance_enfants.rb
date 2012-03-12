class CreateSeanceEnfants < ActiveRecord::Migration
  def change
    create_table :seance_enfants do |t|
      t.date :date_of_seance
      t.string :theme
      t.integer :groupe_enfant_id
      t.timestamps
    end
  end
end
