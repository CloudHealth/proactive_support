ProactiveSupport::Engine.routes.draw do
  root to: 'proactive_support#index'
  resources :notes
end
