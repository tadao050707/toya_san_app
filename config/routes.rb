Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'teams#index' 
  resources :attendancebooks
  resources :teams do
    resources :kids
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
