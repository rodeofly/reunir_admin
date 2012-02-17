class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.text :content
      t.integer :category_id
      t.integer :profil_id
      t.timestamps
    end
  end
end
