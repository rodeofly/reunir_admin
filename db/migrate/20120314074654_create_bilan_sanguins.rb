class CreateBilanSanguins < ActiveRecord::Migration
  def change
    create_table :bilan_sanguins do |t|
      t.date :date_of_bilan
      t.string :glycemie
      t.string :tryglycerides
      t.string :cholesterol
      t.string :hdl
      t.string :ldl
      t.string :t4l
      t.string :tsh
      t.references :bilanable, :polymorphic => true
      t.timestamps
    end
  end
end
