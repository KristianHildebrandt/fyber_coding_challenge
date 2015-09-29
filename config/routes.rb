Rails.application.routes.draw do
  root to: 'offer_wall#form'

  post '/list' => 'offer_wall#list'
end
