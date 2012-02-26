class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_type
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.timestamps
    end
  end
end
