Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users do
    collection do
      get 'login'
    end
  end
  resources :groups do
    resources :messages do
      resources :chats  do
      end
      collection do
        get 'search'
      end
    end
  end
end
