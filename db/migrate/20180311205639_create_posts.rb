class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :main_title
      t.string :sub_title
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
