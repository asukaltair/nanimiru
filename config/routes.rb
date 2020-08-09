Rails.application.routes.draw do

	devise_for :admins, controllers: {
		sessions:      'admins/sessions',
		passwords:     'admins/passwords',
		registrations: 'admins/registrations'
	}

	devise_for :users, controllers: {
		sessions:      'public/sessions',
		passwords:     'public/passwords',
		registrations: 'public/registrations'
	}

	scope module: :public do

		get 'users/:name' => 'users#show', as: 'user'
		get 'users/:name/edit' => 'users#edit', as: 'user_edit'
		patch 'users/:name' => 'users#update'

	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
