require 'eventmachine'
require 'faye'

var n = 0;

EM.run {
  client = Faye::Client.new('http://localhost:9292/faye')

  client.subscribe('/zipplo') do |message|
   	client.publish('/zipplo', 'text' => 'pong')

  end

}