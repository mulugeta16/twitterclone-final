Rails.application.routes.draw do
  get 'posts/index'

  get '/posts', to: 'posts#index'
  root 'posts#index'
  resources :posts do
    collection do
      post :confirm
    end
  end

end
