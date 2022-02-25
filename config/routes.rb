Rails.application.routes.draw do
  #from google authorization. This could go to whatever controller
  #we want.  User or Session maybe?  Just did routed this to 'user#create'
  #for now.
  get '/auth/google_oauth2/callback' to: 'users#create'
end
