Rails.application.routes.draw do
  get 'clinic/index'
  get 'api/clinics' => 'clinic#index'
  get 'api/clinics/:id' => 'clinic#show'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
