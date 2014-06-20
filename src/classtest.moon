require "framework.functions"
require "framework.debug"

ccclass=_G['class']


Thing = require 'thing'

Dog = ccclass("Dog",Thing)

Dog.bite=()->
    print "I bite you"


dump(Dog)

class Person extends Thing
  say_name: => print "Hello, I am", @name
  new:=>
    print "i created"
  "new":=>
    print "i am new created"


p = Person()
p.name = "MoonScript"
p\say_name!

dump(Person)
