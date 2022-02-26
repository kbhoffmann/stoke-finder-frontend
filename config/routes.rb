Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/dashboard', to: 'users#show'
  delete '/logout', to: 'users#logout'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login_user'
  get '/auth/google_oauth2/callback', to: 'users#auth'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get 'adventures/search', to: 'adventures#search'
end
