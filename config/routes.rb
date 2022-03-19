Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  #      URI/URL           Controller#Method        Route preffix 
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  #get 'pages/about'
  get 'about-me', to: 'pages#about'
  #get 'pages/contact'
  get 'contact', to: 'pages#contact'
  
  resources :blogs
  
  root to: 'pages#home'
end
