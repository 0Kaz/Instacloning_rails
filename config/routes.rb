Rails.application.routes.draw do

  get 'comments/index'
  get 'comments/create'
  get 'comments/destroy'
  get 'comments/comment_params'
  get 'index/create'
  get 'index/destroy'
  get 'index/comment_params'
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
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
  end
end
