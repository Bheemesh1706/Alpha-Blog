Rails.application.routes.draw do
 
  resources :articles
   root 'pages#main'
   get 'about', to: 'pages#about'
   get 'about/bot', to: 'pages#bot'
   get 'signup', to: 'users#new'
   resources :users, except: [:new]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   delete 'logout', to: 'sessions#destroy'

   resources :categories, except: [:destroy]
    
end
