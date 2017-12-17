Rails.application.routes.draw do
  root 'goals#index'
  resources :goals do
    resources :tasks, only: [:new, :edit]
  end

  resources :tasks

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
