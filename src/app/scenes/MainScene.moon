
GameServer = require "gameserver"

MainScene = cclass "MainScene",()->
  print "MainScene:init"
  return display.newScene("MainScene")


MainScene.ctor=()=>
  connectLabel = ui.newTTFLabelMenuItem
    text:"socket connect"
    size:64
    align:ui.TEXT_ALIGN_CENTER
    x:display.cx
    y:display.top-32
    listener:handler(self,self.connectClicked)


  dump connectLabel
  self\addChild(ui.newMenu({connectLabel}))
  return

MainScene.onEnter=()->return
MainScene.onExit=()->return

MainScene.connectClicked=()->
  printInfo("i want to connect server.")
  GameServer.login(3,"","192.168.90.149",12003)
  return


print("MainScene========")
dump(MainScene)
return MainScene
