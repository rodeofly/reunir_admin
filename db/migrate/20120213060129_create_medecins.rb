class CreateMedecins < ActiveRecord::Migration
  def change
    create_table :medecins do |t|
      t.string :name
      t.string :specialty
      t.string :email
      t.boolean :organization_member
      t.timestamps
    end
  end
end
