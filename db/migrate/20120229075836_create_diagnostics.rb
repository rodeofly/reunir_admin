class CreateDiagnostics < ActiveRecord::Migration
  def change
    create_table :diagnostics do |t|
      t.date :date_du_diagnostic
      t.date :date_du_prochain_diagnostic
      t.string :diagnostic_type
      t.boolean :anomalie_activite_physique
      t.boolean :anomalie_temps_ecran
      t.boolean :anomalie_grignotage
      t.boolean :anomalie_consommation_soda
      t.boolean :anomalie_alimentation_trop_riche
      t.boolean :anomalie_alimentation_fruits_legumes
      t.boolean :anomalie_composition_repas
      t.boolean :anomalie_contexte_repas
      t.boolean :anomalie_repartition_repas
      t.string :motivation_famille
      t.string :motivation_enfant
      t.references :diagnosticable, :polymorphic => true
      t.timestamps
    end
  end
end
