Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'kamigo/eat', to: 'kamigo#eat'
  get 'kamigo/request_headers', to: 'kamigo#request_headers'
  get 'kamigo/request_body', to: 'kamigo#request_body'
end
