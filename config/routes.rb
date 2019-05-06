Rails.application.routes.draw do
  resources :users do
    resources :orders
  end
end
