Rails.application.routes.draw do
  devise_for :users
  resources :territories, :publishers, :do_not_calls, :house_to_house_records, :congregations

  root 'congregations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
