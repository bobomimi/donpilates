SitemapGenerator::Sitemap.default_host = 'https://danielpilates.herokuapp.com'
SitemapGenerator::Sitemap.create do
  add '/about', :changefreq => 'daily', :priority => 0.9
  add '/contact', :changefreq => 'weekly'
  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end
  Product.find_each do |product|
    add product_path(product), :lastmod => product.updated_at
  end
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
  

SitemapGenerator::Sitemap.default_host = "https://danielpilates.herokuapp.com" # Your Domain Name
SitemapGenerator::Sitemap.public_path = 'tmp/sitemap'
# Where you want your sitemap.xml.gz file to be uploaded.
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new( 
aws_access_key_id: ENV["AWS_ACCESS_KEY"],
aws_secret_access_key: ENV["AWS_SECRET_KEY"],
fog_provider: 'AWS',
fog_directory: ENV["S3_BUCKET_NAME"],
fog_region: ENV["AWS_REGION"]
)

# The full path to your bucket
SitemapGenerator::Sitemap.sitemaps_host = "https://danielpilates.s3.amazonaws.com"
# The paths that need to be included into the sitemap.
SitemapGenerator::Sitemap.create do
    Post.find_each do |post|
     add post_path(post, locale: :en)
     add post_path(post, locale: :es)
     add post_path(post, locale: :he)
     add post_path(post, locale: :de)
    end
    Product.find_each do |product|
     add product_path(product, locale: :en)
     add product_path(product, locale: :es)
     add product_path(product, locale: :he)
     add product_path(product, locale: :de)
    end

    add "en/about"
    add "es/about"
    add "he/about"
    add "de/about"
    add "en/contact"
    add "es/contact"
    add "he/contact"
    add "de/contact"
    add "en/products"
    add "es/products"
    add "he/products"
    add "de/products"
    add "en/posts"
    add "es/posts"
    add "he/posts"
    add "de/posts"
end
