The simulator assumes that you have RabbitMQ installed on the local
instance where you will be running the simulator.

To install the simulator

```
gem install bunny
```

To see the options that you can pass into the simulator:

```
ruby sim.rb -h
```

The default exchange name is **test.spnee.generic**

To define an alternate exchange name to publish to

```
ruby sim.rb -e 'test.spnee.generictwo'
```

The default number of messages that get published out is 2

To publish out more than 2 messages

```
ruby sim.rb -n 10
```

Some examples

```
ruby sim.rb -n 20 -e 'test.spnee.generictwo'
```
