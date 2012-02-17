class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.string :name
      t.string :email
      t.integer :medecin_id
      t.integer :user_id
      t.integer :groupe_enfant_id
      t.integer :groupe_parent_id
      t.timestamps
    end
  end
end
