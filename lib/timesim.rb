require 'yaml'

class TimeSim

  def initialize
    @config = YAML.load_file("./config.yml") rescue nil || {}
  end

  def gen
    puts @config
    puts; puts
    puts @config['config']['amqp_server']
  end

end

mytimesim = TimeSim.new
mytimesim.gen
