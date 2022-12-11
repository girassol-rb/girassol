# frozen_string_literal: true

module Girassol
    module HTTP
        class Request
            attr_reader :method, :route
            attr_accessor :headers

            def initialize(method, route)
                @method = method
                @route = route
                @headers = Hash.new
            end

            def self.parse(client)
                first_line = client.gets.split(" ")
                if first_line[2] != "HTTP/1.1"
                    # TODO: return 400 on the request
                    return
                end
                method = first_line[0]
                route = first_line[1]

                req = Request.new(method, route)

                while true
                    line = client.gets
                    if line == "\r\n"
                        p("Breaked")
                        break
                    end
                    splitted_line = line.split ":"
                    req.headers.store(splitted_line[0], splitted_line[1].strip)
                end

                req
            end
        end
    end
end