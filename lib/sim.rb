require 'bunny'

require 'optparse'
require 'ostruct'
require 'pp'

require_relative './publisher'

class Sim

  def parse(args)

    options = OpenStruct.new
    options.verbose = false
    options.n = 2
    options.e = "test.spnee.generic"

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: sim.rb [options]"

      opts.on("-n N", Integer, "Publish n messages") do |x|
        options.n = x
      end

      opts.on("-e exchange", "Exchange Name") do |c|
        options.e = c
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
    exchange_name = options.e
    exchange = channel.fanout(exchange_name, :passive => true)

    pub = Publisher.new
    pub.publish(options,exchange)

    sleep 3.5
    connection.close
  end

end

mysim = Sim.new
options = mysim.parse(ARGV)
mysim.run(options)
