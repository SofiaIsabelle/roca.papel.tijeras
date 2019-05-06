Rails.application.routes.draw do
  root 'game#index'

  get '/404', to: 'error#not_found'
  get '/500', to: 'error#internal_server_error'

  get '/play', to: 'game#play'
  get '/result/:shape', to: 'game#result', as: :result
  get '/score', to: 'score#index'
end