# frozen_string_literal: true

require_relative '../lib/girassol/server'
require_relative '../lib/girassol/http/request'

require 'rspec/autorun'
require 'net/http'

describe Girassol::Server do
    it 'should run a server' do
        alterada = false
        begin
            server = Girassol::Server.new port:2000
            server.start do | |
                alterada = true
            end
        ensure
            server.shutdown
        end
        expect(alterada).to eq(true)
    end

    it 'should parse a GET bodyless request' do
        begin
            req = Girassol::HTTP::Request.new(nil, nil)
            server = Girassol::Server.new port:2000

            thr = Thread.new {
                server.start do | |
                    client = server.socket.accept
                    req = Girassol::HTTP::Request.parse client
                end
                server.shutdown
            }

            uri = URI("http://localhost:2000/")
            client_request = Net::HTTP.new(uri.host, uri.port)
            client_request.read_timeout = 2
            begin
                client_request.get("/", nil, nil)
            rescue
            end

            expect(req.method).to eq "GET"
            expect(req.route).to eq "/" 
        end

    end
end
