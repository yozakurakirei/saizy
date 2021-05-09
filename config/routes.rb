Rails.application.routes.draw do
  root to:  'about_pages#home'

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'pass_reset/new'
  get 'pass_reset/edit'
  get  '/about', to: 'about_pages#about'
  
  # ログイン系
  get  '/signup', to: 'users#signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  
  # フッター
  get '/worldof', to:'footers#worldof'
  get '/policy', to:'footers#policy'
  get '/privacy', to:'footers#privacy'
  get '/help', to:'footers#help'
  get '/contact', to:'footers#contact'
  
  resources :users
  resources :saizies
  resources :account_activations, only: [:edit]
  mount LetterOpenerWeb::Engine,  at: '/letter_opener' if Rails.env.development?
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
end
