class TranslatePost < ActiveRecord::Migration[5.1]
  def self.up
    Post.create_translation_table!({
      title: :string,
      sub_title: :string,
      image: :string,
      description: :text,
      slug: :string
    }, {
      migrate_data: true,
      remove_source_columns: true
    })
  end

  def self.down
    Post.drop_translation_table! migrate_data: true
  end
end
