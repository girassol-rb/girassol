# frozen_string_literal: true

require 'socket'

module Girassol
    class Server
        attr_reader :port, :socket
        def initialize(port:nil)
            @port = port
        end

        def start(&block)
            @socket = TCPServer.new @port

            block.call if block_given?
        end

        def shutdown
            raise ServerError if @socket.nil?
            @socket.close
            @socket = nil
        end
    end

    class ServerError < StandardError
    end
end