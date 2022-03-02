Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/dashboard', to: 'users#show'

  get '/auth/google_oauth2/callback', to: 'users#auth'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/edit', to: 'users#edit'
  patch '/update', to: 'users#update'
  delete '/delete', to: 'users#destroy'

  get 'adventures/search', to: 'adventures#search'

  get '/areas', to: 'areas#index'
  get '/areas/:id', to: 'areas#show'
end
