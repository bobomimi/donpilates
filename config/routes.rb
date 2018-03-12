Rails.application.routes.draw do
  
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'welcome#index'
    get 'welcome/about'
    devise_for :admins
    resources :products
    resources :posts
    resources :contacts, only: [:new, :create]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/sitemap.xml.gz', to: redirect("https://s3-eu-west-1.amazonaws.com/danielpilates/sitemap.xml.gz")
  end
end
