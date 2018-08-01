Rails.application.routes.draw do
  resources :prescriptions
  resources :patients
  resources :appointments
  resources :doctors
  resources :specialties
  root 'static_pages#home'
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
