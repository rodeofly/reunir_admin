class CreateTuteurs < ActiveRecord::Migration
  def change
    create_table :tuteurs do |t|
      t.string :tuteur_type
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :profession
      t.string :intitule_profession
      t.integer :groupe_parent_id
      t.timestamps
    end
  end
end
