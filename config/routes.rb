Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/catalogue", to: "pages#index"
  get "instrument/:id", to: "pages#show",as:"instrument"
  get "/products/:category", to: "pages#category",as:"cateinstrument"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/booking/:id", to: "pages#booking",as:"booking"
  # Defines the root path route ("/")
  # root "articles#index"
end
