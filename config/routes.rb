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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end