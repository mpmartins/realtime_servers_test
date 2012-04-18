require 'faye/websocket'
require 'eventmachine'

EM.run {
  ws = Faye::WebSocket::Client.new('ws://localhost:3000/faye')

  ws.onopen = lambda do |event|
    p [:open]
    ws.send('Hello, world! : ' + Time.now.to_s)
  end

  ws.onmessage = lambda do |event|
    p [:message, event.data + ' : ' + Time.now.to_s ]
  end

  ws.onclose = lambda do |event|
    p [:close, event.code, event.reason]
    ws = nil
  end
}