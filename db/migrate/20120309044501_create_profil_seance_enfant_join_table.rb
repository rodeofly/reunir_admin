class CreateProfilSeanceEnfantJoinTable < ActiveRecord::Migration
def change
    create_table :profils_seance_enfants, :id => false do |t|
      t.integer :seance_enfant_id
      t.integer :profil_id
    end
  end
end