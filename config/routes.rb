Rails.application.routes.draw do
  devise_for :users
  get 'groups/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
