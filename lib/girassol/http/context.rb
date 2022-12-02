# frozen_string_literal: true

module Girassol
    module HTTP
        class Context

            attr_reader :req, :res
            def initialize(req, res)
                raise BadContext 'req is nil, can\'t initialize contexto' if req.nil?
                raise BadContext 'res is nil, can\'t initialize contexto' if res.nil?

                @req = req
                @res = res
            end
        end
    end
end