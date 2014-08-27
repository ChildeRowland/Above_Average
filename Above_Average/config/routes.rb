Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :profiles
    resources :utilities
    resources :recyclings
    resources :travels
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root to: 'home#index'

  get '/about' => 'home#about', as: :about

  get '/punch' => 'punch#index', as: :punch

  get '/master_graph' => 'graphs#master_graph', as: :mastergraph

   get '/detailed_graphs' => 'graphs#detailed_graphs', as: :detailedgraphs

  get '/example' => 'graphs#example', as: :example

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end


#  Prefix Verb   URI Pattern                                   Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                      devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                      devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                     devise/sessions#destroy
#            user_password POST   /users/password(.:format)                     devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                 devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                devise/passwords#edit
#                          PATCH  /users/password(.:format)                     devise/passwords#update
#                          PUT    /users/password(.:format)                     devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                       devise/registrations#cancel
#        user_registration POST   /users(.:format)                              devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                      devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                         devise/registrations#edit
#                          PATCH  /users(.:format)                              devise/registrations#update
#                          PUT    /users(.:format)                              devise/registrations#update
#                          DELETE /users(.:format)                              devise/registrations#destroy
#            user_profiles GET    /users/:user_id/profiles(.:format)            profiles#index
#                          POST   /users/:user_id/profiles(.:format)            profiles#create
#         new_user_profile GET    /users/:user_id/profiles/new(.:format)        profiles#new
#        edit_user_profile GET    /users/:user_id/profiles/:id/edit(.:format)   profiles#edit
#             user_profile GET    /users/:user_id/profiles/:id(.:format)        profiles#show
#                          PATCH  /users/:user_id/profiles/:id(.:format)        profiles#update
#                          PUT    /users/:user_id/profiles/:id(.:format)        profiles#update
#                          DELETE /users/:user_id/profiles/:id(.:format)        profiles#destroy
#           user_utilities GET    /users/:user_id/utilities(.:format)           utilities#index
#                          POST   /users/:user_id/utilities(.:format)           utilities#create
#         new_user_utility GET    /users/:user_id/utilities/new(.:format)       utilities#new
#        edit_user_utility GET    /users/:user_id/utilities/:id/edit(.:format)  utilities#edit
#             user_utility GET    /users/:user_id/utilities/:id(.:format)       utilities#show
#                          PATCH  /users/:user_id/utilities/:id(.:format)       utilities#update
#                          PUT    /users/:user_id/utilities/:id(.:format)       utilities#update
#                          DELETE /users/:user_id/utilities/:id(.:format)       utilities#destroy
#          user_recyclings GET    /users/:user_id/recyclings(.:format)          recyclings#index
#                          POST   /users/:user_id/recyclings(.:format)          recyclings#create
#       new_user_recycling GET    /users/:user_id/recyclings/new(.:format)      recyclings#new
#      edit_user_recycling GET    /users/:user_id/recyclings/:id/edit(.:format) recyclings#edit
#           user_recycling GET    /users/:user_id/recyclings/:id(.:format)      recyclings#show
#                          PATCH  /users/:user_id/recyclings/:id(.:format)      recyclings#update
#                          PUT    /users/:user_id/recyclings/:id(.:format)      recyclings#update
#                          DELETE /users/:user_id/recyclings/:id(.:format)      recyclings#destroy
#                    users GET    /users(.:format)                              users#index
#                          POST   /users(.:format)                              users#create
#                 new_user GET    /users/new(.:format)                          users#new
#                edit_user GET    /users/:id/edit(.:format)                     users#edit
#                     user GET    /users/:id(.:format)                          users#show
#                          PATCH  /users/:id(.:format)                          users#update
#                          PUT    /users/:id(.:format)                          users#update
#                          DELETE /users/:id(.:format)                          users#destroy
#                     root GET    /                                             home#index
#                    punch GET    /punch(.:format)                              punch#index
#                   graphs GET    /graphs(.:format)                             graphs#index
