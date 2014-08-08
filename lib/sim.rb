require_relative './msgeneric'
require 'bunny'
require 'json'

connection = Bunny.new
connection.start

channel = connection.create_channel
exchange = channel.fanout("test.spnee.generic", :passive => true)

msg = Msgeneric.new
n = 5
msgs = msg.build_n_messages(n)
for i in 0..n
  exchange.publish(msgs[i].to_json)
end

sleep 3.5
puts "Disconnecting..."
connection.close
