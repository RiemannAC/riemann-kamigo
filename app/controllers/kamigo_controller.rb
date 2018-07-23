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

  def request_body
    render plain: request.body
  end

  def response_headers
    response.headers['5566'] = 'QQ'# 資料很少，試增加自訂資料到 response headers
    render plain: response.headers.to_h.map{ |key, value|
      "#{key}: #{value}"
    }.sort#.join{"\n"} 不加是 json 加了反沒換行
  end
end
