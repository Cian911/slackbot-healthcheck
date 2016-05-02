class GetSlackUsersController < ApplicationController

  def index
    Slack.configure do |config|
      config.token = ENV['SLACK_TOKEN']
      fail 'Missing Slack API Token!' unless config.token
    end

    client = Slack::Web::Client.new

    client.auth_test

    client.chat_postMessage( channel: '#dev-test', text: 'Hello World!', as_user: true )
  end

end
