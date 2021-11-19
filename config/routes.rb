Rails.application.routes.draw do
  # resources :lists
  # resources :lists, only: [:index, :create, :show, :createCopyText]
  resources :lists, only: [:index, :create, :show] do
    member do
      get 'create_copy_text'
    end
  end
  resources :text_messages, only: [:create]
  root "lists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
