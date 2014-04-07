GradingApp::Application.routes.draw do
  root to: 'exams#new'

  resources :exams, only: [:new, :create, :show]
end
