Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'
  get 'counters/index'
  get 'counters/new'
  root to:  'saizies#index'

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'pass_reset/new'
  get 'pass_reset/edit'
  get '/about', to: 'about_pages#about'


  # cut予定
  get 'home', to: 'about_pages#home'

  # エリア
  get 'prefectures/tokyo', to: 'saizies#tokyo'
  
  # ログイン系
  get  '/signup', to: 'users#signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # inquiry
  get  '/inquiry',         to: 'inquiry#index'
  post '/inquiry/confirm', to: 'inquiry#confirm'
  post '/inquiry/thanks',  to: 'inquiry#thanks'
  
  
  # フッター
  get '/worldof', to:'footers#worldof'
  get '/policy', to:'footers#policy'
  get '/privacy', to:'footers#privacy'
  get '/help', to:'footers#help'
  get '/contact', to:'footers#contact'
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :saizies do
    collection do 
      get :search
    end
  end

  resources :saizies do
    resource :likes, only: [:create, :destroy]
  end

  resources :account_activations, only: [:edit]
  mount LetterOpenerWeb::Engine,  at: '/letter_opener' if Rails.env.development?
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

end
