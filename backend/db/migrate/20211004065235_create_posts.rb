class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :tag
      t.string :author
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
