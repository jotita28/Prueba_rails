Rails.application.routes.draw do

get 'todos/list'
get 'todos', to: 'todos#index'
get 'todos/new', to: 'todos#new'
post 'todos', to: 'todos#create'
get 'todos/:id', to: 'todos#show', as: 'todo'
get 'todos/:id/edit', to: 'todos#edit', as: 'edit'
patch 'todos/:id', to: 'todos#update'
delete 'todos/:id', to: 'todos#destroy', as: 'destroy'

patch 'todos/:id/complete', to: 'todos#complete', as: 'completed'

root 'todos#index'
end
