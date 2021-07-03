Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"
  post 'items/new' => 'items#new'

  resources :items, only: [:index, :new, :create, :edit]

  #resources :users, only: [:edit, :update, :show]

   # end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
