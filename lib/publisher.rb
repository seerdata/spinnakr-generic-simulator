require_relative './msgeneric'
require 'json'

class Publisher

  def publish(options,exchange)
    if options.forever == true
      publish_forever(options,exchange)
    elsif options.i > 1
      publish_iterations(options,exchange)
    else
      publish_once(options,exchange)
    end
  end

  def publish_once(options,exchange)
    msg = get_message_type(options)
    n = options.n
    msgs = msg.build_n_messages(options,n)
    for i in 1..n
      exchange.publish(msgs[i].to_json)
    end
    if options.verbose == true
      print n, " messages were published to ", options.e; puts
    end
  end

  def publish_iterations(options,exchange)
    seconds = options.s
    iterations = options.i
    for i in 1..iterations
      msg = get_message_type(options)
      n = options.n
      msgs = msg.build_n_messages(options,n)
      for i in 1..n
        exchange.publish(msgs[i].to_json)
      end
      if options.verbose == true
        print n, " messages were published to ", options.e; puts
      end
      sleep seconds
    end
  end

  def publish_forever(options,exchange)
    while true
      seconds = options.s
      iterations = options.i
      for i in 1..iterations
        msg = get_message_type(options)
        n = options.n
        msgs = msg.build_n_messages(options,n)
        for i in 1..n
          exchange.publish(msgs[i].to_json)
        end
        if options.verbose == true
          print n, " messages were published to ", options.e; puts
        end
        sleep seconds
      end
    end
  end

  def get_message_type(options)
    Msgeneric.new
  end
end
