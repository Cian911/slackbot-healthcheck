class SlackPostMessageController < ApplicationController

  def index
    Slack.configure do |config|
      config.token = ENV['SLACK_TOKEN']
      fail 'Missing Slack API Token!' unless config.token
    end

    client = Slack::Web::Client.new

    client.auth_test

    # quote = QuoteApi.parse

    # Check time for message
    time = Time.now.strftime("%H:%M").to_i

    if time === 9
      client.chat_postMessage( channel: '#dev-test', text: 'It\'s time to stretch! *Sitting is the new cancer*. Get up for a short walk! Go grab a coffe, tea or fuck it, grab a beer!' , as_user: true )
    elsif time === 12
      client.chat_postMessage( channel: '#dev-test', text: 'It\'s time to stretch! *Sitting WILL KILL YOU*. Get up and stretch you lazy maggot!' , as_user: true )
    elsif time === 16
      client.chat_postMessage( channel: '#dev-test', text: 'It\'s time to stretch! *Sitting is..* .You know at this staging. Get up for a short walk! Go grab a coffe, tea or fuck it, granb a beer!' , as_user: true )
    end
  end

end