class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.string :title
      t.text :explain
      t.integer :user_id
      t.integer :category_id
      t.integer :comment_id
      t.integer :achievement, default: 0

      t.timestamps
    end
  end
end
