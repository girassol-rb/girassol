# frozen_string_literal: true
require_relative 'lib/girassol/version'

Gem::Specification.new do |s|
    s.name = 'girassol'
    s.version = Girassol::VERSION
    s.license = 'MIT'
    s.summary = "A simple non-opinionated HTTP server"
    s.description = s.summary

    s.required_ruby_version = ">= 3.0.0"

    s.authors = [ "Jefferson Quesado", "Eron Alves" ]
    s.email = [ "jeff.quesado@gmail.com", "eron.alves@rocketmail.com" ]

    s.files = [
        "lib/girassol.rb",
        "lib/girassol/version.rb",
    ]

end