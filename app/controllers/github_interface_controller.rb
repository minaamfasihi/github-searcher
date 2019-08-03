class GithubInterfaceController < ApplicationController
	before_action :validate_query, only: [:index]

	def index
		@repos = params[:repos]
		if @search_type == 'repo'
			github = Github.search.repos @query
			# github.search.repos 'query'
			# github.search.repos q: 'query'
			@repos = github.items
			puts @repos
		elsif @search_type == 'user'
			@repos = Github.repos.list user: @query
			puts @repos
		end
		puts params if params.present?
	end

	def show_repos
		
	end

	private
	
	def validate_query
		return if params['query'].blank? || params['query'].length > 100 || params['search_type'].blank? || params['search_type'].length > 10

		@query = params['query'].to_s.downcase
		@search_type = params['search_type'].to_s.downcase
	end
end
