Rails.application.routes.draw do
  get 'about/index'
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  match '/admin/users',   to: 'admin/users#index',   via: 'get'
  root 'welcome#index'

  resources :apis do
    collection do
      get :search
    end
  end

  resources :users do
    collection do
      get :inspect
    end
  end

  resources :medicine_manufacturers do
    collection do
      get :search
    end
    resources :medicines
  end

  resources :medicines do
    collection do
      get :search
    end
  end

  resources :apisearches do
    collection do
      get :inspect
    end
  end
  resources :medsearches do
    collection do
      get :inspect
    end
  end

  resources :andasearches do
    collection do
      get :inspect
    end
  end

  resources :certsearches do
    collection do
      get :inspect
    end
  end

  namespace :admin do
    resources :products
    resources :apis do
      collection do
        get :search
      end
      collection do
        post :import
      end
    end
    resources :medicine_manufacturers do
      resources :medicines
      collection do
        get :search
      end
      collection do
        post :import
      end
    end
    resources :andas do
      collection do
        get :search
      end
      collection do
        post :import
      end
    end

    resources :certificates do
      collection do
        get :search
      end
      collection do
        post :import
      end
    end

    resources :medicines do
      collection do
        get :search
      end
      collection do
        post :import
      end
    end
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
    resources :articles do
      member do
        post :reorder
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
    collection do
      get :search
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end

  resources :andas do
    collection do
      get :search
    end
  end

  resources :certificates do
    collection do
      get :search
    end
  end

  resources :articles
  resources :images, only: [:create, :destroy]

end
