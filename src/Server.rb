require 'socket'

class App

  @@f = []

  @@server

  def use(port)
    puts "Listening on " + port.to_s
    
    fiber = Fiber.new do
      server = TCPServer.new port
      loop do 
        client = server.accept
        client.puts "Hello world!"
        client.close
        Fiber.yield
      end
    end

    @@f.push(fiber)
    
    i = 0

    p(@@f.length())
    while i < @@f.length()
      @@f.at(i).resume()
      i += 1
      if i == @@f.length
        i = 0
      end
    end

  end
end
