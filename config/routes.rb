Rails.application.routes.draw do
  # get 'victims/bam'
  # get 'welcome'
  # get 'pick_generator'
  # post 'pick_generator'
  # get 'spam_jam' #main form
  # post 'spam_jam' #create with params
  # get 'sent'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/new/1', to: 'spam_emails#new1'
  get '/new/2', to: 'spam_emails#dog'
  post '/new/2', to: 'spam_emails#new'
  get '/bam', to: 'victims#bam'
  get '/', to: 'spam_emails#welcome'

  resources :spam_emails
  resources :fake_emails
  resources :spam_types
  resources :users
  resources :victims

end
