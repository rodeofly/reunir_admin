class AddColumnIntituleProfessionToTuteur < ActiveRecord::Migration
  def change
    add_column :tuteurs, :intitule_profession, :string

  end
end
