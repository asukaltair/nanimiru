Rails.application.routes.draw do

	devise_for :admins, controllers: {
		sessions:      'admin/sessions',
		passwords:     'admin/passwords',
		registrations: 'admin/registrations'
	}

	devise_for :users, controllers: {
		sessions:      'public/sessions',
		passwords:     'public/passwords',
		registrations: 'public/registrations'
	}

	namespace :admin do

		resources :users, only: [:index, :show]
		put 'users/:id' => 'users#update', as: 'user_update'

	end

	scope module: :public do

		get 'users/:name' => 'users#show', as: 'user'
		get 'users/:name/edit' => 'users#edit', as: 'user_edit'
		patch 'users/:name' => 'users#update'

	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
