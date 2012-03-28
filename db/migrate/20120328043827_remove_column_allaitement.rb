class RemoveColumnAllaitement < ActiveRecord::Migration
  def change
    remove_column(:profils, :allaitement)
  end
end
