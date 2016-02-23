Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/merchants/find_all', to: "merchants#index", defaults: { format: :json }
      get '/merchants/find', to: "merchants#show", defaults: { format: :json }
      get '/merchants/random', to: "random_merchant#show", defaults: { format: :json }
      resources :merchants, only: [:index, :show], defaults: { format: :json }

      get '/items/find_all', to: "items#index", defaults: { format: :json }
      get '/items/find', to: "items#show", defaults: { format: :json }
      get '/items/random', to: "random_item#show", defaults: { format: :json }
      resources :items, only: [:index, :show], defaults: { format: :json }

      get '/customers/find_all', to: "customers#index", defaults: { format: :json }
      get '/customers/find', to: "customers#show", defaults: { format: :json }
      get '/customers/random', to: "random_customer#show", defaults: { format: :json }
      resources :customers, only: [:index, :show], defaults: { format: :json }

      get '/invoices/find_all', to: "invoices#index", defaults: { format: :json }
      get '/invoices/find', to: "invoices#show", defaults: { format: :json }
      get '/invoices/random', to: "random_invoice#show", defaults: { format: :json }
      resources :invoices, only: [:index, :show], defaults: { format: :json }

      get '/invoice_items/find_all', to: "invoice_items#index", defaults: { format: :json }
      get '/invoice_items/find', to: "invoice_items#show", defaults: { format: :json }
      get '/invoice_items/random', to: "random_invoice_item#show", defaults: { format: :json }
      resources :invoice_items, only: [:index, :show], defaults: { format: :json }

      get '/transactions/find_all', to: "transactions#index", defaults: { format: :json }
      get '/transactions/find', to: "transactions#show", defaults: { format: :json }
      get '/transactions/random', to: "random_transaction#show", defaults: { format: :json }
      resources :transactions, only: [:index, :show], defaults: { format: :json }
    end
  end
end
