require 'bunny'

#require 'optparse'
#require 'ostruct'
#require 'pp'

require_relative './options'
require_relative './publisher'

class Sim

=begin
  def parse(args)

    options = OpenStruct.new
    options.forever = false
    options.verbose = false

    options.d = 10
    options.e = "test.spnee.generic"
    options.i = 1
    options.m = "useragent"
    options.n = 2
    options.s = 10
    options.t = "visit"

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: sim.rb [options]"

      # Boolean switch.
      opts.on("-f", "Run forever") do |v|
        options.forever = v
      end

      # Boolean switch.
      opts.on("-v", "Run verbosely") do |v|
        options.verbose = v
      end

      # String Options

      opts.on("-t Type", "String Type name") do |t|
        options.t = t
      end

      opts.on("-m Dimension", "String Dimension name") do |m|
        options.m = m
      end

      opts.on("-e Exchange", "String Exchange name") do |c|
        options.e = c
      end

      # Integer Options

      opts.on("-d Days", Integer, "Integer Time simulation interval") do |x|
        options.d = x
      end

      opts.on("-i Iterations", Integer, "Integer Publish i iterations") do |x|
        options.i = x
      end

      opts.on("-n Messages", Integer, "Integer Publish n messages") do |x|
        options.n = x
      end

      opts.on("-s Seconds", Integer, "Integer Sleep s seconds") do |x|
        options.s = x
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
=end

=begin
  def initialize
    @myoptions = MyOptions.new
    puts @myoptions
    puts 'got called'
  end
=end
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
myoptions = Options.new
options = myoptions.parse(ARGV)
if options.verbose == true
  puts options
end
mysim.run(options)
