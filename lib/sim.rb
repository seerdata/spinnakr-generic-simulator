require_relative './msgeneric'
require 'bunny'
require 'json'

require 'optparse'
require 'ostruct'
require 'pp'

class Sim

  def parse(args)

    options = OpenStruct.new
    options.verbose = false
    options.n = 2

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: sim.rb [options]"

      opts.on("--n N", Integer, "Publish n messages") do |x|
        options.n = x
      end

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

    end

    opt_parser.parse!(args)
    options
  end

  def run(options)
    connection = Bunny.new
    connection.start

    channel = connection.create_channel
    exchange = channel.fanout("test.spnee.generic", :passive => true)

    msg = Msgeneric.new
    n = options.n
    msgs = msg.build_n_messages(n)
    for i in 1..n
      exchange.publish(msgs[i].to_json)
    end

    sleep 3.5
    print n, " messages were published..."; puts
    connection.close
  end

end

mysim = Sim.new
options = mysim.parse(ARGV)
mysim.run(options)
