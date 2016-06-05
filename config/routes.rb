Rails.application.routes.draw do
  resources :labels, defaults: {format: :json}
  resources :issues, only: [:index, :show, :create, :update, :destroy], defaults: {format: :json}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
