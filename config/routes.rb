Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :admins
    root 'welcome#index'
    get 'welcome/about'
    resources :contacts, only: [:new, :create]
    resources :products
    resources :posts
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
