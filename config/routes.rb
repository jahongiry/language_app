Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :lessons do
        resources :text_question_sets
      end
      resources :questions
      resources :user_answers
      post '/login', to: 'sessions#create'
    end
  end
end
