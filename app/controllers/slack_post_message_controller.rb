class SlackPostMessageController < ApplicationController

  def index
    Slack.configure do |config|
      config.token = ENV['SLACK_TOKEN']
      fail 'Missing Slack API Token!' unless config.token
    end

    client = Slack::Web::Client.new

    client.auth_test

    quote = QuoteApi.parse

    client.chat_postMessage( channel: '#dev-test', text: 'QOTD - "' + quote + '"', as_user: true )
  end

end