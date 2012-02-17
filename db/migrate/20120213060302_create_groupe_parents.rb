class CreateGroupeParents < ActiveRecord::Migration
  def change
    create_table :groupe_parents do |t|
      t.string :name

      t.timestamps
    end
  end
end
