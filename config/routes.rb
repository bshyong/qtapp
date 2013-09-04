Timeblocks::Application.routes.draw do
  get "/start(/:id)" => "timeblocks#start", as: "start_activity"
  get "/stop(/:id)" => "timeblocks#stop", as: "stop_activity"
  resources :activities
  get "/settings" => "pages#settings", as: "settings"
  root :to => "pages#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end