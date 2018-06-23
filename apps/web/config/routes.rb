# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
resources :articles, only: [:index, :new, :create, :destroy]
root to: 'articles#index'
delete '/articles/:id', to: 'articles#destroy'
