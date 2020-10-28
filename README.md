# Timer For LOVË2D

Timer is a LOVË2D class responsible for calling a function after a certain time.

An waiting time and a callback function are set by the client passing
a param table at constructor or calling its respective set methods.


## PRE-REQUIREMENTS

- [LOVË2D](https://love2d.org/) Platform. 
- Timer.lua must be able to use [class.lua](https://github.com/vrld/hump/blob/master/class.lua). Ex: `Class = require 'lib/class'`  


## PUBLIC METHODS

### Constructor

- `init(params)`: Constructor function responsable for a Timer instantiation. Parameter `params` is a table with the following format:

```
{
    time = ... ,
    alarmFunction = function() return ... end,
    loop = ... ,
}
```

where:

- `time`: Number that represents the current time in seconds.

- `alarmFunction`: Client's callback function that will be called after the set time.

- `lopp`: Boolean that flags if the timer will be automatically restarted.


### Timer Handler Methods

- `reset()`: Public function responsible for reset the Timer.

- `start()`: Public function responsible for start the Timer.

- `pause()`: Public function responsible for pauses the Timer.


### Set Methods

- `setAlarmFunction(afunc)`: Public function responsible for set the callback function. The `afunc` parameter is a client's callback function.

- `setTime(time)`: Public function responsible for set Timer's delay. The `time` parameter is a number that represents Timer's delay value in seconds.


### Get/Has Methods

- `getTime()`: Public function responsible for return current time value.

- `isRunning()`: Public function responsible for return a boolean value that indicates if timer is running.

- `hasExpired()`: Public function responsible for return a boolean value that indicates if timer has expired.

- `setLoop(bLoop)`: Public function responsible for defining whether the Timer will automatically restart after a time cycle. The bLoop parameter is boolean. Parameter `bLoop` is a boolean. 
