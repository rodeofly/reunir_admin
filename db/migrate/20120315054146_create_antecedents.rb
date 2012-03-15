class CreateAntecedents < ActiveRecord::Migration
  def change
    create_table :antecedents do |t|
      t.string :antecedent_type
      t.string :parent
      t.references :antecedentable, :polymorphic => true
      t.timestamps
    end
  end
end
