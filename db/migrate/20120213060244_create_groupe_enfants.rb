class CreateGroupeEnfants < ActiveRecord::Migration
  def change
    create_table :groupe_enfants do |t|
      t.string :name

      t.timestamps
    end
  end
end
