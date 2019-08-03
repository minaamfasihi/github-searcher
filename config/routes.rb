Rails.application.routes.draw do
	root to: 'github_interface#index'
	post '/search', to: 'github_interface#search'
end
