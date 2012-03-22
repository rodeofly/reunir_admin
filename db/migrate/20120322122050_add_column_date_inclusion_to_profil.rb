class AddColumnDateInclusionToProfil < ActiveRecord::Migration
  def change
    add_column :profils, :date_inclusion, :date

  end
end
