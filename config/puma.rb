# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server

# The environment variable WEB_CONCURRENCY may be set to a default value based
# on dyno size. To manually configure this value use heroku config:set
# WEB_CONCURRENCY.
workers 1
threads(8,8)

preload_app!

rackup DefaultRackup
environment ENV.fetch("RACK_ENV", "development")
