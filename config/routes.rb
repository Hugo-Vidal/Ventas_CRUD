Rails.application.routes.draw do
  post 'sales', to: 'sales#create'
  get 'sales/new'
  get 'sales/:id', to: 'sales#done', as: 'done'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
