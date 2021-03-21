Rails.application.routes.draw do
  get 'users/signup'
  root 'about_pages#home'
  get  '/about', to: 'about_pages#about'
  get  '/signup', to: 'users#signup'
  resources :users

  # フッター
  get '/worldof', to:'footers#worldof'
  get '/policy', to:'footers#policy'
  get '/privacy', to:'footers#privacy'
  get '/help', to:'footers#help'
  get '/contact', to:'footers#contact'
end
