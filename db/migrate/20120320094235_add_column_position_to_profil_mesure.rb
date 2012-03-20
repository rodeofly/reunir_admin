class AddColumnPositionToProfilMesure < ActiveRecord::Migration
  def change
    add_column :profil_mesures, :position, :integer

  end
end
