require 'socket'

s = TCPSocket.new '127.0.0.1', 3000

while line = s.gets
    puts line
end