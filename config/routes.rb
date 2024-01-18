Rails.application.routes.draw do

  resources :midia do
    member do
    get 'arquivo', to: 'midia#show_arquivo'
  end
end
  resources :empresas do
    member do
      get 'logomarca', to: 'empresas#show_logomarca'
    end
  end
  resources :usuarios 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
