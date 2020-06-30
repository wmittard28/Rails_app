Rails.application.routes.draw do
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

    resources :tags

    scope "/jobs" do
      get'/new', to: 'jobs#quick_new_jobs', as: "quick_new_job"
      post'/', to: 'jobs#create', as: "post_quick_new_job"
      get'/all', to: 'jobs#all', as: "get_all_jobs"
    end

    resources :projects
    
  end
end
