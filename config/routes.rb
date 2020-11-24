Rails.application.routes.draw do
  get 'countries/index'
  root 'countries#index'

  get 'countries/search', to: 'countries#search', :as => 'search_page'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
