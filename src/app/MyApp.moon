
require "config"

MyApp = cclass("MyApp",cc.mvc.AppBase)


MyApp.ctor=()=>
  print "MyApp:ctor"
  self.super\ctor()

MyApp.run=()=>
  print "MyApp:run"
  CCFileUtils\sharedFileUtils()\addSearchPath "res/"
  self\enterScene("MainScene")

dump(MyApp)
return MyApp
