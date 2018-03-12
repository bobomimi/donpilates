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
  


