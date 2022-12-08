# frozen_string_literal: true

require_relative '../lib/girassol/server'
require 'rspec/autorun'

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
end
