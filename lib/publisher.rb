require_relative './msgeneric'
require 'json'

class Publisher

  def publish(options,exchange)
    msg = Msgeneric.new
    n = options.n
    msgs = msg.build_n_messages(n)
    for i in 1..n
      exchange.publish(msgs[i].to_json)
    end
    print n, " messages were published to ", options.e; puts
  end

end
