class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :questionnaire_id
      t.integer :fusion_group_id
      t.integer :fusion_question_id
      t.timestamps
    end
  end
end
