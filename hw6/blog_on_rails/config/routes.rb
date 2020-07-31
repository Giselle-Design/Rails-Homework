Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   get "/", to: "welcome#root", as: "root"




  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only:[:new, :create, :edit, :update, :show] do
    get   'edit_password'
    patch 'update_password'
  end

  resource :session, only:[:new, :create, :destroy]


end
