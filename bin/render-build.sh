set -o errexit

bundle install
yarn install
bundle exec rake db:migrate
