ProactiveSupport::Engine.routes.draw do
  root to: 'proactive_support#index'
  resources :notes
  resources :flags do
    collection do
      get '/:source/:identifier', to: 'flags#show'
    end
  end
end
