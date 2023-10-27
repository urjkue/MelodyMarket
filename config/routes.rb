Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/catalogue", to: "instruments#index"
  get "instrument/:id", to: "instruments#show",as:"instrument"
  get "/brows/:category", to: "instruments#cate",as:"cateinstrument"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
