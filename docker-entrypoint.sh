#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# install Gems
bundle install

# Check all Node modules are installed
yarn install --check-files

# Run the application
bundle exec rails s -p 3000 -b "0.0.0.0"
