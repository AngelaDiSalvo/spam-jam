Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :spam_emails
  resources :fake_emails
  resources :spam_types
  resources :users
  resources :victims

end
