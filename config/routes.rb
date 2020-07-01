Rails.application.routes.draw do
    root to: "users#index"



    resources :users

    resources :sessions, only: [:new, :create, :destroy]


    get 'signout', to: 'sessions#destroy', as: 'signout'

    get 'signin', to: 'sessions#new', as: 'signin'
    get 'signin_with_google', to: redirect('/auth/google_oauth2'), as: 'signin_with_google'
    get 'register', to: "users#new", as: 'signup'
    get 'auth/failure', to: redirect('/')
    get "/auth/:provider/callback" => "sessions#omnilogin"


  resources :job_applications, only: [:new, :create, :index, :update, :destroy, :show, :edit]

  resources :companies do
    resources :job_applications, only: [:index]
  end




end
