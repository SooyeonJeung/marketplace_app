Rails.application.routes.draw do
  get 'messages/index'
  get 'conversations/index'
  devise_for :users
  root "products#home"
  get "/restricted", to: "products#restricted", as: "restricted"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  resources :products
  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
end
