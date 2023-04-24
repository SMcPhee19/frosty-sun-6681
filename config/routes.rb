Rails.application.routes.draw do
  resources :patient_doctors, only: [:destroy]
  resources :patients
  resources :doctors, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
