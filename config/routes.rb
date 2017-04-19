Rails.application.routes.draw do
  get 'sales/' =>'sales#index'
  get 'sales/index' =>'sales#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
