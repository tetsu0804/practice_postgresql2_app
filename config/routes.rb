Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api do
    post '/blog', controller: :blogs, action: :create
    get '/blogs', controller: :blogs, action: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
