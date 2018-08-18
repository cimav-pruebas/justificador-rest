# json.key_format! camelize: :lower
json.extract! justificacion, :id, :empleado_id, :tipo_id, :empleado_elaboro_id, :empleado_autorizo_id,
              :moneda_id, :requisicion, :proyecto, :proveedor_uno, :proveedor_dos, :proveedor_tres, :bien_servicio,
              :subtotal, :iva, :importe, :condiciones_pago, :datosbanco, :razoncompra, :terminos_entrega, :plazo_entrega,
              :rfc, :curp, :telefono, :email, :fecha_inicio, :fecha_termino, :fecha_elaboracion, :descripcion, :monto_uno,
              :monto_dos, :monto_tres, :domicilio, :es_unico, :plazo, :num_pagos, :porcen_anticipo, :autoriza_cargo, :forma_pago,
              :num_dias_plazo, :motivo_seleccion, :es_nacional, :created_at, :updated_at, :identificador, :partida_id, :decision
#
json.url justificacion_url(justificacion, format: :json)


