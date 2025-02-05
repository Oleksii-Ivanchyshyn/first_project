Rails.application.routes.draw do


 resources :questions
 resources :users,only: %i[new create]
 resource :session, only: %i[new create destroy]
 #resources :my_questions
 
 get '/my_questions', to: 'questions#my_questions', as: 'my_questions'

 
 root to: 'questions#index'

 
 #post '/questions', to: 'questions#create'
 #get '/questions', to: 'questions#show'
 #patch '/questions', to: 'questions#update'
 #delete '/questions', to: 'questions#destroy'
 #get '/my_questions', to: 'questions#my_questions', as: 'my_questions'

end
