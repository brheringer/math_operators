Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :operation, only: [:index, :new]

  root 'operations#index'
end
