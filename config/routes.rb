Linuxwiki::Application.routes.draw do
  get 'main/index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :commands
  get 'commands/search/:search', to: 'commands#search'

  root to: 'commands#index'
end
