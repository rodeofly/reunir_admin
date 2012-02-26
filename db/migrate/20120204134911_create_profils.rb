class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthdate
      t.string :classroom
      t.integer :school_id
      t.integer :medecin_id
      t.integer :user_id
      t.integer :groupe_enfant_id
      t.timestamps
    end
  end
end
