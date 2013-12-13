Linuxwiki::Application.routes.draw do
  get 'main/index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  scope '/api' do
    resources :commands
    get 'commands/search', to: 'commands#search'
  end

  root to: 'main#index'
end
