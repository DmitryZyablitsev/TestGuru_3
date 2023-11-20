set -o errexit

bundle install
yarn install
bundle exec rake db:migrate
bundle exec rake assets:precompile; 
bundle exec rake assets:clean
