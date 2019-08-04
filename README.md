# Github Searcher

This is a web app that searches for github repos based on repo names or by user name (option is given as a select tag). It uses `http://piotrmurach.github.io/github/` for Github API calls.

# Running the app:
You need to have an `.env` file in the root directory with the following two fields:  
`LOGIN="<your-github-login>"<br />
PASSWORD="<your-password>"`  

These fields are being used in the `config/application.rb` file.
We've defined constants such as `PER_PAGE` for pagination in a file called `config/initializers/constant.rb`.

# Details:
All the application code involving Github API is in `app/controllers/github_interface_controller.rb`.
Pagination is done natively by the used gem, however some logic was involved when it came to rendering it on the page which could be seen in `app/views/github_interface/index.html.erb` and the helper `app/helpers/application_helper.rb`.

There is no database since we don't need to persist anything and so no need of running migrations.

Bootstrap is used for some styling.

# Tests:
Tests can be run from the root application directory by running: 
`rspec`

# Test Coverage:
Test coverage is done using `simplecov`. The output of `simplecov` is an HTML file named `index.html` that goes inside `coverage` folder.

Currently, the coverage is `85.71%`.

Testing could further be expanded to cover more cases.
