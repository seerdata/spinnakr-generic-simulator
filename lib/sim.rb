require_relative './msgeneric'
require 'bunny'
require 'json'

connection = Bunny.new
connection.start

channel = connection.create_channel
exchange = channel.fanout("test.spnee.generic", :passive => true)

mg = Msgeneric.new
msg_hash = mg.buildmsg

exchange.publish(msg_hash.to_json)

sleep 3.5
puts "Disconnecting..."
connection.close
