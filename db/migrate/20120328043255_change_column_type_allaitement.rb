class ChangeColumnTypeAllaitement < ActiveRecord::Migration
  def change
    change_column(:profils, :duree_allaitement, :string)
  end
end
