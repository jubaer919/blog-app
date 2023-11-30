class CreatePost < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comment_counter
      t.integer :like_counter
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
