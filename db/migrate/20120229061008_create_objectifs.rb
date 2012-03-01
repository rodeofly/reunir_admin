class CreateObjectifs < ActiveRecord::Migration
  def change
    create_table :objectifs do |t|
      t.string :objectif_type
      t.text :objectif
      t.boolean :atteint
      t.references :objectivable, :polymorphic => true
      t.timestamps
    end
  end
end
