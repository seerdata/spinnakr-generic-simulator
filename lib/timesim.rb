require 'active_support/core_ext/date/calculations.rb'
require 'active_support/core_ext/numeric/time'

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

  def test
    time = Time.now
    puts time
    puts time.to_i
    startdate = Date.parse('2012-12-09')
    puts startdate
    startime = startdate.to_time
    puts startime
    puts startime.to_i

    daysago = 10
    daysago = daysago.day.ago.to_date
    puts daysago
  end

end

mytimesim = TimeSim.new
mytimesim.test
