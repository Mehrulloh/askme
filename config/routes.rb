Rails.application.routes.draw do
  # post "/questions", to: "questions#create"
  # put "/questions/:id", to: "questions#update"
  # delete "/questions/:id", to: "questions#destroy"
  resources :questions
end
