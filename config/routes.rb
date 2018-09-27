Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'
  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
             :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  resources :users, only: [:show]

  resources :posts, only: [ :index, :show, :create, :destroy ] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy, :index, :show, :new, :edit, :update ], shallow: true
  end
end
