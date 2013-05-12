Hitched::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :events, :weddings, :comments
  resources :events do
    resources :comments
  end
end