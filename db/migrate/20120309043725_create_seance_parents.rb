class CreateSeanceParents < ActiveRecord::Migration
  def change
    create_table :seance_parents do |t|
      t.date :date_of_seance
      t.string :theme
      t.integer :groupe_parent_id
      t.timestamps
    end
  end
end
