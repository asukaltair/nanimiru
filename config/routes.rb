Rails.application.routes.draw do

  namespace :public do
    get 'homes/about'
  end
	devise_for :admins, controllers: {
		sessions:      'admin/sessions',
		passwords:     'admin/passwords',
	}

	devise_for :users, controllers: {
		sessions: 'public/sessions',
		passwords:     'public/passwords',
		registrations: 'public/registrations',
	}

	namespace :admin do

		root 'photos#index'
		resources :photos, only: [:show, :edit, :update] do
			resources :comments, only: [:update]
		end

		resources :users, only: [:index, :show]
		put 'users/:id' => 'users#update', as: 'user_update'
		get 'users/:id/followings' => 'relationships#followings', as: 'user_followings'
		get 'users/:id/followers' => 'relationships#followers', as: 'user_followers'

		get 'comments' => 'comments#index', as: 'comments'

	end

	scope module: :public do

		root 'photos#index'
		resources :photos, only: [:new, :create, :show, :edit, :update, :destroy] do
			resources :comments, only: [:create, :edit, :update, :destroy]
			resource :favorites, only: [:create, :destroy]
		end

		get 'about' => 'homes#about', as: 'about'

		get 'users/:name' => 'users#show', as: 'user'
		get 'users/:name/edit' => 'users#edit', as: 'user_edit'
		patch 'users/:name' => 'users#update'

		get 'users/:name/followings' => 'relationships#followings', as: 'user_followings'
		get 'users/:name/followers' => 'relationships#followers', as: 'user_followers'
		post 'follow/:name' => 'relationships#create', as: 'follow'
		delete 'unfollow/:name' => 'relationships#destroy', as: 'unfollow'

		get 'search' => 'photos#search', as: 'search'

		resources :inquiries, only: [:create]
		get 'contact' => 'inquiries#new', as: 'contact'
		get 'contact/finish' => 'inquiries#finish', as: 'contact_finish'
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
