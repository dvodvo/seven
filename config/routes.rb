Rails.application.routes.draw do
  get 'staticpages/home'
  resources :confirmation, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :update], param: :password_reset_token
  resources :cartitems do
    collection do
      post  :insert_article
    end
    member do
      patch :update_q
    end
  end
  resources :carts do
    collection do
      get   :articles_by
      get   :articles_direct
    end
  end
  resources :articles
  resources :appointments
  resources :departments
  resources :articlephotos do
    collection do
      get   :scan
      post  :barcode_section_update
    end
  end
  resources :messages do
    collection do
      get   :sms_pre
      post  :sms_post
    end
  end
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "staticpages#index"
  get  'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get  'account', to: 'users#edit'
  put  'account', to: 'users#update'
  delete 'account', to: 'users#destroy'
end
