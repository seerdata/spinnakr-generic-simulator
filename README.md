
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
