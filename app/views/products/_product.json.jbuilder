json.extract! product, :id, :title, :main_title, :sub_title, :image, :price, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
