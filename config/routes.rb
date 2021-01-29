Rails.application.routes.draw do
  get 'imports/progress', to: 'imports#progress'
  get '/', to: 'main#index'
end
