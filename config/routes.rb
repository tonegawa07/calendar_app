Rails.application.routes.draw do
  root 'icp_reservations#index'
  resources :cn_reservations
  resources :icp_reservations
end
