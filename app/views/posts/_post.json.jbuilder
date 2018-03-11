json.extract! post, :id, :title, :main_title, :sub_title, :image, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
