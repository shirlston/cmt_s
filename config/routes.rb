Rails.application.routes.draw do
  resources :npi_records, only: [:index, :create]
end
