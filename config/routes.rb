Rails.application.routes.draw do


  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  get '/' => 'homes#top'
  resources :genres, only: [:index, :create, :edit, :update]
end
scope module: :public do
 root to: 'homes#top'
 get 'about' => 'homes#about', as: 'about'


  resources :items, only: [:index,:show]
  resources :customers, only: [:edit,:update] do
    collection do
      get :mypage
      get :unsubscribe
      patch :withdraw
    end
  end

  resources :cart_items, only: [:index,:update,:destroy,:create] do
    collection do
      delete :destroy_all
    end
  end

  resources :orders, only: [:index,:show,:new,:create] do
    collection do
      post :comfiem
      get :complete
    end
  end

  resources :shipping_addresses, only: [:index,:create,:destroy,:edit,:update]



end

get "about" => "public/homes#about", as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
