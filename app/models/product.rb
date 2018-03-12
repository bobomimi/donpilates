class Product < ApplicationRecord
  translates :title, :main_title, :sub_title, :image, :price, :description, :slug
  extend FriendlyId
  friendly_id :title, use: [:globalize, :history, :slugged]
  globalize_accessors locales: [:en, :es, :he, :de], attributes: [:title, :main_tile, :sub_title, :price, :description, :slug]
    def normalize_friendly_id(input)
     input.gsub(".", "").to_slug.to_s
    end
    def should_generate_new_friendly_id?
      attribute_changed?('title')
    end
     
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, default_url: "/images/:style/missing.png"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
