Rails.application.routes.draw do
  resources :summoners
  resources :champions
  root :to => 'summoners#home'
  post '/champions/compare' => 'champions#compare', as: 'compare'
end
