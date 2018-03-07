class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :sub_title
      t.string :image
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
