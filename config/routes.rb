Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/dashboard', to: 'users#show'
  delete '/logout', to: 'users#logout'

  get '/auth/google_oauth2/callback', to: 'users#auth'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/edit', to: 'users#edit'
  patch '/update', to: 'users#update'
  delete '/delete', to: 'users#destroy'

  get '/rec_areas/search', to: 'rec_areas#search'
  get '/rec_areas/search_by_location', to: 'rec_areas#search_by_location'
  get '/rec_areas/search_by_activities', to: 'rec_areas#search_by_activities'
  get '/rec_areas/:id', to: 'rec_areas#show'


  get '/areas', to: 'areas#index'
  get '/areas/:id', to: 'areas#show'
end
