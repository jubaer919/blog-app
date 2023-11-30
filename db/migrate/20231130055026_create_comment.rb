class CreateComment < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :user, foreign_key: { to_table: :users }
      t.references :post, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end

