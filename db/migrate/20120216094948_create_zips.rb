class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.string :zipcode
      t.string :city

      t.timestamps
    end
  end
end
