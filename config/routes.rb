# frozen_string_literal: true

Rails.application.routes.draw do
  resources :merchants, only: [:index, :show] 
  
end
