-- helo

__G__TRACKBACK__=(errorMessage)->
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")

require "framework.init"
export cclass=_G['class']
MyApp = require 'app.MyApp'
MyApp.new()\run()
print "aa main init"
return
