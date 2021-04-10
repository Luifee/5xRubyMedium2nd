Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations' }

  resources :memos
  root 'pages#index'
end
