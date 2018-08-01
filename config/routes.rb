Rails.application.routes.draw do
  resources :prescriptions
  resources :patients
  resources :appointments
  resources :doctors
  resources :specialties
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
