Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations' }

  get '@:username/:memo_id', to: 'pages#show', as: 'memo_page'
  get '@:username', to: 'pages#user', as: 'user_page'

  resources :memos
  root 'pages#index'
end
