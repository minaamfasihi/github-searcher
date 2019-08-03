Rails.application.routes.draw do
	root to: 'github_interface#index'
	get '/show_repos', to: 'github_interface#show_repos'
end
