Rails.application.routes.draw do
  resources :summoners
  resources :champions
  root :to => 'summoners#home'
end
