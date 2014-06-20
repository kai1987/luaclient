-- this is a socket connect with gameserver.
-- liangkai 2014,6,13


cc.utils = require "framework.cc.utils.init"
cc.net = require "framework.cc.net.init"
SocketTCP = cc.net.SocketTCP


onStatus=(__event)->
  printInfo "socket status:#{__event.name}"

onData=(__event)->
  printInfo "socket data:#{__event.data}"

printInfo "hello everyitwo"

class GameServer
  @_playerId
  @_token
  @_host
  @_port
  @sock = nil

  onConnected:(__event)=>
    printInfo "socket status:#{__event.name}"
    --- todo send login

  @login=(playerId,token="",host="",port=0)->
    @_playerId = playerId
    @_token = token
    @_host = host
    @_port = port

    printInfo "gameserver:login:host:#{host},port:#{port},playerId:#{playerId},token:#{token}"
    sock = SocketTCP.new host,port,false
    sock\addEventListener(SocketTCP.EVENT_CONNECTED,self.onConnected)
    sock\addEventListener(SocketTCP.EVENT_CLOSE,onStatus)
    sock\addEventListener(SocketTCP.EVENT_CLOSED,onStatus)
    sock\addEventListener(SocketTCP.EVENT_CONNECT_FAILURE,onStatus)
    sock\addEventListener(SocketTCP.EVENT_DATA,onData)
    return

printInfo "hello lua socket"

return GameServer
---GameServer.login(3,"","localhost",12003)
---return
