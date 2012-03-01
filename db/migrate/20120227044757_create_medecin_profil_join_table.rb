class CreateMedecinProfilJoinTable < ActiveRecord::Migration
def change
    create_table :medecins_profils, :id => false do |t|
      t.integer :profil_id
      t.integer :medecin_id
    end
  end
end