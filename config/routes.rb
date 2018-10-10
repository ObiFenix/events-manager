Rails.application.routes.draw do

  root 'sessions#index'

  get 'sessions/sw' => 'sessions#switch'
  # post 'sessions/register' => 'sessions#register'
  post 'sessions/login' => 'sessions#login'
  delete 'logout' => 'sessions#logout'

  get '/attends/:user_id/events/:event_id' => 'attends#create'
  post '/comments/:user_id/events/:event_id' => 'comments#create'
  get '/attends/:user_id/events/:event_id/destroy' => 'attends#destroy'
  # post '/sessions/create' => 'sessions#create'

  resources :users
  resources :events
  resources :sessions
  # resources :attends do
  #   resources :events
  # end

# Prefix          Verb      URI Pattern                                          Controller#Action
# ================================================================================================
# root            GET       /                                                    sessions#index
# sessions_sw     GET       /sessions/sw(.:format)                               sessions#switch
# sessions_login  POST      /sessions/login(.:format)                            sessions#login
# logout          DELETE    /logout(.:format)                                    sessions#logout
#                 GET       /attends/:user_id/events/:event_id(.:format)         attends#create
#                 POST      /comments/:user_id/events/:event_id(.:format)        comments#create
#                 GET       /attends/:user_id/events/:event_id/destroy(.:format) attends#destroy
# users           GET       /users(.:format)                                     users#index
#                 POST      /users(.:format)                                     users#create
# new_user        GET       /users/new(.:format)                                 users#new
# edit_user       GET       /users/:id/edit(.:format)                            users#edit
# user            GET       /users/:id(.:format)                                 users#show
#                 PATCH     /users/:id(.:format)                                 users#update
#                 PUT       /users/:id(.:format)                                 users#update
#                 DELETE    /users/:id(.:format)                                 users#destroy
# events          GET       /events(.:format)                                    events#index
#                 POST      /events(.:format)                                    events#create
# new_event       GET       /events/new(.:format)                                events#new
# edit_event      GET       /events/:id/edit(.:format)                           events#edit
# event           GET       /events/:id(.:format)                                events#show
#                 PATCH     /events/:id(.:format)                                events#update
#                 PUT       /events/:id(.:format)                                events#update
#                 DELETE    /events/:id(.:format)                                events#destroy
# sessions        GET       /sessions(.:format)                                  sessions#index
#                 POST      /sessions(.:format)                                  sessions#create
# new_session     GET       /sessions/new(.:format)                              sessions#new
# edit_session    GET       /sessions/:id/edit(.:format)                         sessions#edit
# session         GET       /sessions/:id(.:format)                              sessions#show
#                 PATCH     /sessions/:id(.:format)                              sessions#update
#                 PUT       /sessions/:id(.:format)                              sessions#update
#                 DELETE    /sessions/:id(.:format)                              sessions#destroy
end
