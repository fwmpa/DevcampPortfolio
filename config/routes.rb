Rails.application.routes.draw do
  root to: 'pages#home'

  resources :portfolios

  #get 'pages/about'
  get 'about-me', to: 'pages#about'
  #get 'pages/contact'
  get 'contact', to: 'pages#contact'

  resources :blogs

end
