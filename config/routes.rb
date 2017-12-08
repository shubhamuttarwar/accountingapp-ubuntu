Rails.application.routes.draw do
  
  get 'welcome/index'

  root 'welcome#index'
  
  get '/projectscalendar' => 'projects#projectscalendar'
  get '/totalsales' => 'projects#totalsales'
  resources :customers do
  	resources :projects 
  end

  resources :projects do
  		resources :addons
  	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
