Rails.application.routes.draw do
  root 'about_pages#home'
  get  '/about', to: 'about_pages#about'
  get  '/signup', to: 'user#signup'
end
