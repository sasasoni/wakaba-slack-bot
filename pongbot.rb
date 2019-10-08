require 'slack-ruby-bot'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'サイコロ' do |client, data, match|
    num = rand(1..6)
    mark = '!' * num
    client.say(text: "#{num}#{mark}", channel: data.channel)
  end
end

PongBot.run