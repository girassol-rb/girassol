# frozen_string_literal: true

module Girassol
    module HTTP
        class Request
            def initialize

            end
            def parse(client)
                first_line = client.gets.split(" ")
                if first_line[2] != "HTTP/1.1"
                    # TODO: return 400 on the request
                    return
                end



            end
        end
    end
end