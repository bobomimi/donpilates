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
    
    has_attached_file :image,
      :styles => {
        :thumb=> "100x100#",
        :small  => "300x300>",
        :large => "900x900>"
          },
      :storage => :s3,
      :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd1egmt44b887qe.cloudfront.net', 
      :bucket => 'danielpilates',
      :s3_region => ENV['AWS_REGION'],
      :s3_protocol => :https


    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end