Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # namespace :web do 
    resources :users
    resources :clocked_time, only: %i(index create update) do
      get :followee_sleep_timings, on: :collection
    end
    resources :followers
  # end
  
end
