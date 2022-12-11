# frozen_string_literal: true

module Girassol
    module HTTP
        class Request
            attr_reader :method, :route , :headers

            def initialize
                @headers = Hash.new
            end

            def parse(client)
                first_line = client.gets.split(" ")
                if first_line[2] != "HTTP/1.1"
                    # TODO: return 400 on the request
                    return
                end
                @method = first_line[0]
                @route = first_line[1]

                while true
                    header = client.gets
                    if header == "/r/n"
                        break
                    end
                    header = header.split ":"
                    headers.store(header[0], header[1])
            end
        end
    end
end