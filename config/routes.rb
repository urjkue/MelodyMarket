Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/catalogue", to: "pages#index", as:"catalogue"
  get "instrument/:id", to: "pages#show",as:"instrument"
  get "/products/:category", to: "pages#category",as:"cateinstrument"
  get "/Abouts-us", to: "pages#Aboutus", as:"about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/booking", to: "pages#booking", as: "booking"
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get '/instruments/:id/add-review', to: 'pages#new_review', as: 'new_review'
  post '/instruments/:id/add-review', to: 'pages#create_review', as: 'create_review'
  # Defines the root path route ("/")
  # root "articles#index"
end
