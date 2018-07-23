Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'kamigo/eat', to: 'kamigo#eat'
  get 'kamigo/request_headers', to: 'kamigo#request_headers'
  get 'kamigo/request_body', to: 'kamigo#request_body'
  get 'kamigo/response_headers', to: 'kamigo#response_headers'
  get 'kamigo/response_body', to: 'kamigo#show_response_body' # response_body 方法名已被 Rails 使用，故禁用否則會爆炸
  post 'kamigo/webhook', to: 'kamigo#webhook'
end
