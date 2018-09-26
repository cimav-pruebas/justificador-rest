Rails.application.routes.draw do
  resources :partidas
  resources :asistentes
  resources :personas
  resources :justificaciones
  resources :monedas
  resources :tipos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/justificaciones/all_by_id_empleado/:id', to: 'justificaciones#all_by_id_empleado'
  get '/personas/cuenta/:cuenta_cimav', to: 'personas#cuenta', :constraints => { :cuenta_cimav => /([^\/]+?)(?=\.json|\.html|$|\/)/ }

  get '/proveedores/:empleado_id', to: 'justificaciones#proveedores'

  get '/cotizaciones/:id/:num_provee', to: 'justificaciones#cotizacion'
  get '/mercado/:id', to: 'justificaciones#mercado'

  get '/justificaciones/show_by_requisicion/:requisicion', to: 'justificaciones#show_by_requisicion'
end
