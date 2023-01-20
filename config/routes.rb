# frozen_string_literal: true

Rails.application.routes.draw do
  root 'kudos#index'
  devise_for :employees
  resources :kudos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end