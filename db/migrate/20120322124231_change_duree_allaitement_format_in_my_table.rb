class ChangeDureeAllaitementFormatInMyTable < ActiveRecord::Migration
  def self.up
   change_column :profils, :duree_allaitement, :float
  end

  def self.down
   change_column :profils, :duree_allaitement, :integer
  end
end
