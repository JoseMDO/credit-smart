source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"
gem "devise"
gem 'simple_form'
gem "pundit"
gem "csv"
gem 'kaminari'
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "ransack"
gem "rails_admin", "~> 3.1"
gem "cssbundling-rails"
gem "sassc-rails"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"

end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# AppDev Gems
# ===========
gem "appdev_support"
gem "awesome_print"
gem "dotenv-rails"
gem "faker"
gem "htmlbeautifier"
gem "http"
gem "sqlite3", "~> 1.4"
gem "table_print"

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "draft_generators"
  gem "grade_runner"
  gem "pry-rails"
  gem "rails_db"
  gem "rails-erd"
  gem "rufo"
  gem "specs_to_readme"
  gem "web_git"
end

group :development, :test do
  gem "rspec-rails", "~> 6.0.0"
end

group :test do
  gem "draft_matchers"#, "0.0.2"#path: "../../my_stuff/draft_matchers"
  gem "rspec-html-matchers"
  gem "webmock"
end
