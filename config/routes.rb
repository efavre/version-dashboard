Rails.application.routes.draw do

  root 'dashboard#index'
  resources :deploys

end
