# frozen_string_literal: true

module Girassol
    module HTTP
        class Request
            attr_reader :method, :route , :headers

            def initialize
                @headers = Hash.new
            end

            def self.parse(client)
                req = Request.new
                first_line = client.gets.split(" ")
                if first_line[2] != "HTTP/1.1"
                    # TODO: return 400 on the request
                    return
                end
                req.method = first_line[0]
                req.route = first_line[1]

                while true
                    header = client.gets
                    if header == "/r/n"
                        break
                    end
                    header = header.split ":"
                    req.headers.store(header[0], header[1])
                end
                
                req
            end
        end
    end
end