class ChangeFacteurDeclenchantFormatInMyTable < ActiveRecord::Migration
  def self.up
   change_column :profils, :facteur_declenchant, :string
  end

  def self.down
   change_column :profils, :facteur_declenchant, :boolean
  end
end
