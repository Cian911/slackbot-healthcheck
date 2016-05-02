# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ENV['SSL_CERT_FILE'] = "C:/Users/Cian/http/htdocs/certificats/cacert.pem"
ENV['SLACK_TOKEN'] = ''
