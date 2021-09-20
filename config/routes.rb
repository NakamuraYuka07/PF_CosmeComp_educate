Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  scope module: :users do
    root to: 'homes#top'
    get 'search' => 'homes#search'
    resources :users, only: [:show, :edit, :update]do
      get :favorites, on: :collection
    end
    get '/users/check' => "users#check", as: 'users_check'
    put "/users/hide" => "users#hide", as: 'users_hide'
    get 'item_categories/index'
    get 'item_categories/:id/item_search', to: 'item_categories#search', as: 'item_search'
    resources :components, only: [:show, :index]
    get 'comp_categories/index'
    get 'comp_categories/:id/comp_search', to: 'comp_categories#search', as: 'comp_search'
    resources :items, only: [:show, :index] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :item_categories, only: [:index, :create, :edit, :update]
    resources :components, only: [:new, :create, :index, :show, :edit, :update]
    resources :comp_categories, only: [:index, :create, :edit, :update]
    resources :users, only: [:index, :create, :show, :edit, :update]
  end
end
