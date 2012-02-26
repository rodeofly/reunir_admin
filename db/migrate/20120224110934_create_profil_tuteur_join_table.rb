class CreateProfilTuteurJoinTable < ActiveRecord::Migration
def change
    create_table :profils_tuteurs, :id => false do |t|
      t.integer :profil_id
      t.integer :tuteur_id
    end
  end
end