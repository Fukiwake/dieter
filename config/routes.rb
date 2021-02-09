Rails.application.routes.draw do
  
  get 'chats/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'homes#top'
  get 'finder' => "finders#finder"
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    member do
      get :followings, :followers
    end
  end
  resources :diaries do
    resources :diary_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :chats, only: [:create]
  get "chat/:id" => "chats#show", as: "chat"
end
