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
     
 

  
  has_attached_file :image,
      styles: {index: '348x199>',show: '700x400>'},
      :default_url => "/images/:style/missing.png",
      :storage => :s3,
      :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd36y0kv3zyrf84.cloudfront.net', 
      :bucket => 'danielpilates',
      use_timestamp: false

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
