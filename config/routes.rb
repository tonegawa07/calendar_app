Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :cn_reservations do
    collection do
      get :history
    end
  end
  resources :icp_reservations do
    collection do
      get :history
    end
  end
end
