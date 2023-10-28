Rails.application.routes.draw do
  devise_for :users


  devise_scope :user do
    authenticated :user do
      #     root "cars#index", as: :authenticated_root
    end
    unauthenticated do
      root to: "pages#home"
      get "/catalogue", to: "instruments#index"
      get "/product/:id", to: "instruments#show",as:"instrument"
      get "/category/:category", to: "instruments#category",as:"cateinstrument"
      get "/instrument/:name", to: "instruments#instrument", as:"instruinstrument"
    end
  end





  # devise_scope :user do
  #   authenticated :user do
  #     root "cars#index", as: :authenticated_root
  #   end
  #   unauthenticated do
  #     root "pages#home", as: :unauthenticated_root
  #   end
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
