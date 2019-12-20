Rails.application.routes.draw do
  devise_for :users
  get 'groups/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "groups#index"
  resources :users, only: [:index, :create, :new, :show, :destroy, :edit, :update] do
    collection do
      get 'login'
    end

  end
end
