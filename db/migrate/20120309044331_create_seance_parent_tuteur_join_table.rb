class CreateSeanceParentTuteurJoinTable < ActiveRecord::Migration
def change
    create_table :seance_parents_tuteurs, :id => false do |t|
      t.integer :seance_parent_id
      t.integer :tuteur_id
    end
  end
end