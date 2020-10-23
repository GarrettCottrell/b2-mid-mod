Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#shelters
  get '/mechanics', to: 'mechanics#index'
  get '/amusementparks/:id', to: 'amusement_parks#show'
end
