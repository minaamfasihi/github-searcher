class GithubInterfaceController < ApplicationController
	before_action :validate_search_query, only: [:index]

	def index
		begin
			if @search_type == 'repo'
				@curr_page = Github.search.repos @query, per_page: PER_PAGE, page: @target_page_num
				@repo_items = @curr_page.items
			elsif @search_type == 'user'
				@repo_items = Github.repos.list user: @query, per_page: PER_PAGE, page: @target_page_num
				@curr_page = @repo_items
			end
		rescue StandardError => e
			return redirect_to root_path
		end
	end

	private
	
	def validate_search_query
		return if params['query'].blank? || params['query'].length > 100 || params['search_type'].blank? || params['search_type'].length > 10

		@query = params['query'].to_s.downcase
		@search_type = params['search_type'].to_s.downcase
		@target_page_num = params[:target_page_num]
	end
end
