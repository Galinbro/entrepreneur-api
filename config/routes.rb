Rails.application.routes.draw do
  
  devise_for :users, skip: %i[registrations sessions passwords confirmations]
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post '/signup', to: 'registrations#create'
        get '/resend-confirmation-email', to: 'registrations#new'
        post '/login', to: 'sessions#create'
        delete '/logout', to: 'sessions#destroy'
      end
    end  
  end
  devise_for :users, :controllers => {:confirmations => "users/confirmations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
