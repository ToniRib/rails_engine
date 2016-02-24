Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/merchants/random', to: 'random_merchant#show'
      get '/merchants/find_all', to: 'merchants#index'
      get '/merchants/find', to: 'merchants#show'

      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#index'
      end

      get '/items/find_all', to: 'items#index'
      get '/items/find', to: 'items#show'
      get '/items/random', to: 'random_item#show'

      resources :items, only: [:index, :show] do
        get '/invoice_items', to: 'items/invoice_items#index'
        get '/merchant', to: 'items/merchants#show'
      end

      get '/customers/find_all', to: 'customers#index'
      get '/customers/find', to: 'customers#show'
      get '/customers/random', to: 'random_customer#show'

      resources :customers, only: [:index, :show] do
        get '/invoices', to: 'customers/invoices#index'
        get '/transactions', to: 'customers/transactions#index'
      end

      get '/invoices/find_all', to: 'invoices#index'
      get '/invoices/find', to: 'invoices#show'
      get '/invoices/random', to: 'random_invoice#show'

      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items', to: 'invoices/items#index'
        get '/customer', to: 'invoices/customers#show'
        get '/merchant', to: 'invoices/merchants#show'
      end

      get '/invoice_items/find_all', to: 'invoice_items#index'
      get '/invoice_items/find', to: 'invoice_items#show'
      get '/invoice_items/random', to: 'random_invoice_item#show'

      resources :invoice_items, only: [:index, :show] do
        get '/item', to: 'invoice_items/items#show'
        get '/invoice', to: 'invoice_items/invoices#show'
      end

      get '/transactions/find_all', to: 'transactions#index'
      get '/transactions/find', to: 'transactions#show'
      get '/transactions/random', to: 'random_transaction#show'

      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions/invoices#show'
      end
    end
  end
end
