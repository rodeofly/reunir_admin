class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :schooltype
      t.string :name
      t.integer :zip_id

      t.timestamps
    end
  end
end
