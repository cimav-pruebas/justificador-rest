# json.array! @justificaciones, partial: 'justificaciones/justificacion', as: :justificacion
# json.key_format! camelize: :lower

json.array! @justificaciones do |justificacion|

  json.extract! justificacion, :id, :empleado_id, :tipo_id, :empleado_elaboro_id, :empleado_autorizo_id, :moneda_id, :requisicion, :proyecto,
                :proveedor_uno, :proveedor_dos, :proveedor_tres, :bien_servicio, :subtotal, :iva, :importe, :condiciones_pago, :datosbanco, :razoncompra, :terminos_entrega,
                :plazo_entrega, :rfc, :curp, :telefono, :email, :fecha_inicio, :fecha_termino, :fecha_elaboracion, :descripcion, :monto_uno, :monto_dos, :monto_tres, :domicilio,
                :es_unico, :plazo, :num_pagos, :porcen_anticipo, :autoriza_cargo, :forma_pago, :num_dias_plazo, :motivo_seleccion, :es_nacional, :created_at, :updated_at, :identificador

  json.url justificacion_url(justificacion, format: :json)

  json.empleado do
    json.id justificacion.empleado.id
    json.clave justificacion.empleado.clave
    json.tipo justificacion.empleado.tipo
    json.nombre justificacion.empleado.nombre
    json.sede justificacion.empleado.sede
    json.cuenta_cimav justificacion.empleado.cuenta_cimav
  end
  json.tipo do
    json.id justificacion.tipo.id
    json.code justificacion.tipo.code
    json.fraccion justificacion.tipo.fraccion
    json.romano justificacion.tipo.romano
  end
  json.moneda do
    json.id justificacion.moneda.id
    json.code justificacion.moneda.code
    json.nombre justificacion.moneda.nombre
    json.simbolo justificacion.moneda.simbolo
  end
  json.autoriza do
    json.id justificacion.autoriza.id
    json.clave justificacion.autoriza.clave
    json.tipo justificacion.autoriza.tipo
    json.nombre justificacion.autoriza.nombre
    json.sede justificacion.autoriza.sede
    json.cuenta_cimav justificacion.autoriza.cuenta_cimav
  end
  json.elabora do
    json.id justificacion.elabora.id
    json.clave justificacion.elabora.clave
    json.tipo justificacion.elabora.tipo
    json.nombre justificacion.elabora.nombre
    json.sede justificacion.elabora.sede
    json.cuenta_cimav justificacion.elabora.cuenta_cimav
  end


end