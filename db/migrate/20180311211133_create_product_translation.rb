class CreateProductTranslation < ActiveRecord::Migration[5.1]
  def self.up
    Product.create_translation_table!({
      title: :string,
      main_title: :string,
      sub_title: :string,
      image: :string,
      price: :decimal,
      description: :text,
      slug: :string
    }, {
      :migrate_data => true,
      :remove_source_columns => true
    })
  end

  def self.down
    Product.drop_translation_table! :migrate_data => true
  end
end
