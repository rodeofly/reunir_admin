class CreateMedecins < ActiveRecord::Migration
  def change
    create_table :medecins do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialty
      t.boolean :organization_member
      t.timestamps
    end
  end
end
