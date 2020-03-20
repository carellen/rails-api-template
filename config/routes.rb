require 'api_constraints'

Rails.application.routes.draw do
  apipie
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :products, only: :index
      resource :cart, only: %i[show create], controller: :cart
      resource :cart, only: :destroy, controller: :cart, path: 'cart/:product_id'
    end
  end
  match '*unmatched', to: 'application#route_not_found', via: :all
end
