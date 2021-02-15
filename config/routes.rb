Rails.application.routes.draw do
  devise_for :users
  resources :guides do
    resources :messages, only: :create
    collection do
      get 'search'
    end
  end  
  root to: "guides#index"
  resources :users, only: [:show, :edit, :update]
end
