Rails.application.routes.draw do
   root 'game#index'
   get '/play', to: 'game#play'
  
  
  
end
