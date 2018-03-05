Rails.application.routes.draw do
  resources :territory, :publisher, :do_not_call, :house_to_house_record, :congregation

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
