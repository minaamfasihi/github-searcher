require "rails_helper"

describe "GET repos by repo name" do
	before do
		@repos = Github.search.repos 'react', per_page: PER_PAGE
	end
	it 'fetches all repos related to react' do
		expect(@repos.items.first.full_name).to include("react")
		expect(@repos.items.count).to eq(PER_PAGE)
		expect(@repos.items.first.full_name).not_to include("angular")
	end
end

p "Sleeping for 2 secs to throttle API requests"
sleep 2

describe "GET repos by user" do
	before do
		@user_repos = Github.repos.list user: 'minaamfasihi', per_page: PER_PAGE
	end
	it 'fetches all repos related to minaamfasihi' do
		expect(@user_repos.first.owner.login).to eq("minaamfasihi")
		expect(@user_repos.first.owner.login).not_to eq("johndoe")
		expect(@user_repos.count).to eq(PER_PAGE)
	end
end
