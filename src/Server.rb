require 'socket'

class App

    @@server

    def use(port)
        puts "Listening on " + port.to_s
        server = TCPServer.new port
        loop do 
            client = server.accept
            client.puts "Hello world!"
            client.close
        end
    end
end
