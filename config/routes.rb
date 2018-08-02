Rails.application.routes.draw do
  resources :users
  resources :prescriptions
  resources :patients
  resources :appointments
  resources :doctors
  resources :specialties
  root 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'session'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/doctor_signup', to: 'doctor_signup#new', as: 'doctor_signup'
  post '/doctor_signup', to: 'doctor_signup#create'
  get '/patient_signup', to: 'patient_signup#new', as: 'patient_signup'
  post '/patient_signup', to: 'patient_signup#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
