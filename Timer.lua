--[[

TIMER CLASS FOR LOVË2D - Version 1.0

--------------------------------------------------------------------
LICENSE

Copyright 2020 Leonardo Geo Cruz Bcheche

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

Except as contained in this notice, the name(s) of the above copyright holders
shall not be used in advertising or otherwise to promote the sale, use or
other dealings in this Software without prior written authorization.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

--------------------------------------------------------------------

DESCRIPTION

The Timer is a LOVË2D Class responsible for calling a function after a certain time.

The waiting time and the callback function are setup by the client passing
a param table at constructor or calling its respective set methods.

]]

Timer = Class{}

-- Constructor function responsable for a Timer instantiation.
-- params: a table with the following format:
-- {time = [number],alarmFunction = function() return [function] end,continuous = [boolean],}
function Timer:init(params)

    self.timeSetup = params.time -- timeSetup: global variable that holds the original time setup in seconds.
    self.time = params.time -- time: global variable that represents the current time in seconds.
    self.alarmFunction = params.alarmFunction -- alarmFunction: clients callback function that will be called after the set time.
    self.loop = params.loop or false -- loop: global boolean variable that flags if the timer will automatically reset

    self.running = false --running: global boolean variable that flags if the timer has started.
    self.expired = false -- expired: global boolean variable that flags if the timer has expired.
    
end


--[[
    UPDATE FUNCTIONS
]]


-- Default LOVË2D callback function responsable for decrease the timer 
-- checks if the timer has expired and call the callback function. 
function Timer:update(dt)

    if self.running == true and 
    self.expired == false then

        self:checkExpiredAndAlarm()
        self:decreaseTime(dt)

    end
end


-- Update Function responsable for check if the timer has expired,
-- call the callback function and restart the timer if necessary.
function Timer:checkExpiredAndAlarm()

    if self.time <= 0 then

        self.alarmFunction()
        self.expired = true

        if self.loop then

            self:reset()
            self:start()
            
        end
    end

end


-- Update Function responsable for decrease Timer's time. 
function Timer:decreaseTime(dt)

    self.time = math.max(0, self.time - dt)

end


--[[
    PUBLIC FUNCTIONS - TIMER HANDLER
]]


-- Public Function responsible for reset the Timer.
function Timer:reset()

    self.running = false
    self.expired = false
    self.time = self.timeSetup

end

-- Public Function responsible for start the Timer.
function Timer:start()

    self.running = true
    self.expired = false
    
end

-- Public Function responsible for pauses the Timer.
function Timer:pause()
    
    self.running = false

end


--[[
    PUBLIC FUNCTIONS - SET
]]

-- Public Function responsible for set the callback function.
function Timer:setAlarmFunction(afunction)

    self.alarmFunction = afunction

end


-- Public Function responsible for set Timer's in seconds.
function Timer:setTime(time)

    self.time = time
    self.timeSetup = time

end

-- Public Function responsible for set if Timer will be
-- automatically restarted after an time cicle.
function Timer:setLoop(bLoop)

    self.loop = bLoop


end


--[[
    PUBLIC FUNCTIONS - GET/HAS
]]


-- Public Function responsible for return current time value.
function Timer:getTime()

    return self.time

end


-- Public Function responsible for return a boolean value 
-- indicating if the timer is running.
function Timer:isRunning()

    return self.running

end


-- Public Function responsible for return a boolean value 
-- indicating if the timer has expired.
function Timer:hasExpired()

    return self.expired

end

