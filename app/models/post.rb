class Post < ApplicationRecord
	translates :title, :sub_title, :image, :description, :slug
	extend FriendlyId
	friendly_id :title, use: [:globalize, :history, :slugged]
	globalize_accessors locales: [:en, :es, :he, :de], attributes: [:title, :sub_title, :image, :description, :slug]

	def should_generate_new_friendly_id?
      attribute_changed?('title')
    end



end

