class KamigoController < ApplicationController
  # 需要使用第三方 post request => 關閉 CSRF 驗證
  protect_from_forgery with: :null_session
  require 'net/http'

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

  # response_body 已被 Rails 使用
  def show_response_body
    puts "===這是設定前的 response.body:==="
    render plain: "虎哇花哈哈哈" # response.body 的內容
    puts "===這是設定後的 response.body: #{response.body}==="
  end

  def webhook
    render plain: params
    # render plain: params['message']['text'] 回傳部份資料的設定方式
  end

  def sent_request
    uri = URI('http://localhost:3000/kamigo/response_body')
    response = Net::HTTP.get(uri).force_encoding("UTF-8") # ASCII-8BIT 轉 UTF-8，才可以和 UTF-8 編碼的"油"加在一起
    render plain: translate_to_korean(response)
  end

  def translate_to_korean(message)
    "#{message}油~"
  end
end
