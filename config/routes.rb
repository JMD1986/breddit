Rails.application.routes.draw do
  resources :votes
  resources :comments
  resources :links
  resources :boards
  resources :users

  get '/signup', to: "users#new"

  get '/login', to: "sessions#new"
  post '/login', to: "session#create"
  get '/logout', to: "session#destroy"

#       Prefix Verb   URI Pattern                  Controller#Action
#        votes GET    /votes(.:format)             votes#index
#              POST   /votes(.:format)             votes#create
#     new_vote GET    /votes/new(.:format)         votes#new
#    edit_vote GET    /votes/:id/edit(.:format)    votes#edit
#         vote GET    /votes/:id(.:format)         votes#show
#              PATCH  /votes/:id(.:format)         votes#update
#              PUT    /votes/:id(.:format)         votes#update
#              DELETE /votes/:id(.:format)         votes#destroy
#     comments GET    /comments(.:format)          comments#index
#              POST   /comments(.:format)          comments#create
#  new_comment GET    /comments/new(.:format)      comments#new
# edit_comment GET    /comments/:id/edit(.:format) comments#edit
#      comment GET    /comments/:id(.:format)      comments#show
#              PATCH  /comments/:id(.:format)      comments#update
#              PUT    /comments/:id(.:format)      comments#update
#              DELETE /comments/:id(.:format)      comments#destroy
#        links GET    /links(.:format)             links#index
#              POST   /links(.:format)             links#create
#     new_link GET    /links/new(.:format)         links#new
#    edit_link GET    /links/:id/edit(.:format)    links#edit
#         link GET    /links/:id(.:format)         links#show
#              PATCH  /links/:id(.:format)         links#update
#              PUT    /links/:id(.:format)         links#update
#              DELETE /links/:id(.:format)         links#destroy
#       boards GET    /boards(.:format)            boards#index
#              POST   /boards(.:format)            boards#create
#    new_board GET    /boards/new(.:format)        boards#new
#   edit_board GET    /boards/:id/edit(.:format)   boards#edit
#        board GET    /boards/:id(.:format)        boards#show
#              PATCH  /boards/:id(.:format)        boards#update
#              PUT    /boards/:id(.:format)        boards#update
#              DELETE /boards/:id(.:format)        boards#destroy
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy


end
