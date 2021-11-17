Rails.application.routes.draw do
  # resources :lists
  resources :lists, only: [:index, :create, :show]
  resources :text_messages, only: [:create]
  root "lists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
