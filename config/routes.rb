Rails.application.routes.draw do   
  
  root 'tests#index'

  resources :sessions, only: :create
  get :login, to: 'sessions#new'

  resources :users, on: :create
  get :signup, to: 'users#new'

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passings, only: %i[show update] do
    member do
      get :result
    end
  end
end
