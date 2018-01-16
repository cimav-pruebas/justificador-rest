Rails.application.routes.draw do
  resources :asistentes
  resources :personas
  resources :justificaciones
  resources :monedas
  resources :tipos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/justificaciones/all_by_id_empleado/:id', to: 'justificaciones#all_by_id_empleado'
  get '/personas/cuenta/:cuenta_cimav', to: 'personas#cuenta', :constraints => { :cuenta_cimav => /([^\/]+?)(?=\.json|\.html|$|\/)/ }

end


Rails.application.routes.draw do
  resources :asistentes
  resources :justificaciones
  resources :monedas
  resources :tipos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/justificaciones/all_by_id_empleado/:id', to: 'justificaciones#findAllByIdEmpleado'

end