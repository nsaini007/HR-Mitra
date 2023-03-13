Rails.application.routes.draw do
  root 'home#index'
  get 'home' => "home#index"
  get 'about' => 'pages#about_us'
  get 'contact' => "pages#contact_us"
  get 'privacy-policy', to: "pages#privacy_policy"
  get 'terms-and-conditions', to: "pages#terms_and_conditions"

  resources :employees
  resources :documents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
