class KamigoController < ApplicationController
  def eat
    render plain: "吃土啦"
  end

  def request_headers
    render plain: request.headers.to_h.reject{ |key, value|
      key.include?'.'
    }.map { |key, value|
      "#{key}: #{value}"
    }.sort.join("\n")
  end
end
