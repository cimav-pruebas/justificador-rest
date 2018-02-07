#json.key_format! camelize: :lower
json.partial! "justificaciones/justificacion", justificacion: @justificacion

json.tipo do
  if @justificacion.tipo then
    json.id @justificacion.tipo.id
    json.code @justificacion.tipo.code
    json.fraccion @justificacion.tipo.fraccion
    json.romano @justificacion.tipo.romano
    json.texto @justificacion.tipo.texto
  end
end
json.moneda do
  if @justificacion.moneda then
    json.id @justificacion.moneda.id
    json.code @justificacion.moneda.code
    json.nombre @justificacion.moneda.nombre
    json.simbolo @justificacion.moneda.simbolo
  end
end
json.empleado do
  if @justificacion.empleado then
    json.id @justificacion.empleado.id
    json.clave @justificacion.empleado.clave
    json.tipo @justificacion.empleado.tipo
    json.nombre @justificacion.empleado.nombre
    json.sede @justificacion.empleado.sede
    json.cuenta_cimav @justificacion.empleado.cuenta_cimav
  end
end
json.autoriza do
  if @justificacion.autoriza then
    json.id @justificacion.autoriza.id
    json.clave @justificacion.autoriza.clave
    json.tipo @justificacion.autoriza.tipo
    json.nombre @justificacion.autoriza.nombre
    json.sede @justificacion.autoriza.sede
    json.cuenta_cimav @justificacion.autoriza.cuenta_cimav
  end
end
json.elabora do
  if @justificacion.elabora then
    json.id @justificacion.elabora.id
    json.clave @justificacion.elabora.clave
    json.tipo @justificacion.elabora.tipo
    json.nombre @justificacion.elabora.nombre
    json.sede @justificacion.elabora.sede
    json.cuenta_cimav @justificacion.elabora.cuenta_cimav
  end
end
json.partida do
  if @justificacion.partida then
    json.id @justificacion.partida.id
    json.nombre @justificacion.partida.nombre
    json.texto @justificacion.partida.texto
  end
end

