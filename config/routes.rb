Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'redirect/redirects#index'
  get '/:code', to: 'redirect/redirects#show', as: 'return_redirect'

  namespace :api do
    namespace :v1 do
      resources :shorteners, only: [:index, :create]
      post '/menu', to: 'shorteners#menu'
    end
  end
end
