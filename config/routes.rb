Timeblocks::Application.routes.draw do
  resources :activities
  get "/settings" => "pages#settings", as: "settings"
  root :to => "pages#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end