Rails.application.routes.draw do
  root "companies#index"
  resources :job_boards, only: [:index]
  resources :companies, only: [:index, :show, :new, :create]
end
