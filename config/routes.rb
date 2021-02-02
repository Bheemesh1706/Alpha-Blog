Rails.application.routes.draw do
 
  resources :articles
   root 'pages#main'
   get 'about', to: 'pages#about'
   get 'about/bot', to: 'pages#bot'
    
end
