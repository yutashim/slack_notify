require 'dotenv/load'
require 'slack-notify'
require 'clockwork'
include Clockwork

client = SlackNotify::Client.new(
  webhook_url: ENV['WEBHOOK_URL'],
  channel: "#notify",
  username: "mybot",
  icon_emoji: ":dolphin:",
  link_names: 1
)
handler do |job|
  time = Time.now.strftime("at %I:%M:%S")
  job.notify('a message every 3 minutes' + "\n#{time}")
end

every(3.minutes, client)
