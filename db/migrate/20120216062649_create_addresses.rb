class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_type
      t.string :line1
      t.string :line2
      t.integer :zip_id
      t.string :country
      t.references :addressable, :polymorphic => true
      t.timestamps
    end
  end
end
