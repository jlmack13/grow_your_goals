Rails.application.routes.draw do
  root 'goals#index'
  resources :goals do
    resources :tasks, only: [:show, :new, :edit]
  end
  get '/garden' => 'goals#garden'
  resources :tasks

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
