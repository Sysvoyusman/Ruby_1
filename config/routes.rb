Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'welcome/home' , to: 'welcome#home'
  root 'welcome#home'
  # only 'get' will change because the route is different now but the pattern is the same
  get 'contact/about' , to: 'contact#about'
  get 'about' , to: 'welcome#about'

  resources :articles
  
  get 'signup' , to: 'users#new'
  #post 'users' , to: 'users#create'  #this doesnt work with creating other routes

  resources :users , except: [:new]

  # if write contact/about in address bar it will go to contact controller and about action method
end
