Rails.application.routes.draw do
  root to:  'about_pages#home'
  get  '/about', to: 'about_pages#about'
  
  # ログイン系
  get  '/signup', to: 'users#signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  
  # フッター
  get '/worldof', to:'footers#worldof'
  get '/policy', to:'footers#policy'
  get '/privacy', to:'footers#privacy'
  get '/help', to:'footers#help'
  get '/contact', to:'footers#contact'
  
  resources :account_activation, only: [:edit]
end
