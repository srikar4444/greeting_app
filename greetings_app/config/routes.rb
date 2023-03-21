Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # namespace :web do 
    resources :users
    resources :clocked_times, only: %i(index create) do
      get :followee_sleep_timings, on: :collection
    end
    resources :followees, only: %i(index create) do
      delete :delete_relation, on: :collection
    end
  # end
  
end
