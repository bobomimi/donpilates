class Post < ApplicationRecord
  translates :title, :main_title, :sub_title, :image, :description, :slug
  extend FriendlyId
  friendly_id :title, use: [:globalize, :history, :slugged]
  globalize_accessors locales: [:en, :es, :he, :de], attributes: [:title, :main_title, :sub_title, :image, :description, :slug]
    def normalize_friendly_id(input)
     input.gsub(".", "").to_slug.to_s
    end
    def should_generate_new_friendly_id?
      attribute_changed?('title')
    end
    
    has_attached_file :image, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end