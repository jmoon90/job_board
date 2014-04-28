Rails.application.routes.draw do
  root "job_boards#index"
  resources :job_boards, only: [:index]
end
