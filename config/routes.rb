BashProj::Application.routes.draw do
  resources :posts do
    member do
      get :addlike
      get :adddislike
      get :approve
    end
  end


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end