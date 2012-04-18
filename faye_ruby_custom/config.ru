require './app'
Faye::WebSocket.load_adapter('thin')
run App