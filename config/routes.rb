Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/merchants/find', to: "merchants#show", defaults: { format: :json }
      resources :merchants, only: [:index, :show], defaults: { format: :json }

      get '/items/find', to: "items#show", defaults: { format: :json }
      resources :items, only: [:index, :show], defaults: { format: :json }

      get '/customers/find', to: "customers#show", defaults: { format: :json }
      resources :customers, only: [:index, :show], defaults: { format: :json }

      get '/invoices/find', to: "invoices#show", defaults: { format: :json }
      resources :invoices, only: [:index, :show], defaults: { format: :json }

      get '/invoice_items/find', to: "invoice_items#show", defaults: { format: :json }
      resources :invoice_items, only: [:index, :show], defaults: { format: :json }

      get '/transactions/find', to: "transactions#show", defaults: { format: :json }
      resources :transactions, only: [:index, :show], defaults: { format: :json }
    end
  end
end
