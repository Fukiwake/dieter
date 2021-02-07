Rails.application.routes.draw do
  
  devise_for :users
  root 'homes#top'
  resources :users, only: [:show, :edit]
  resources :diaries do
    resources :diary_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
