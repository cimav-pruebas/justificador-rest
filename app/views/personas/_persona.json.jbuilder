# json.key_format! camelize: :lower
json.extract! persona, :id, :tipo, :clave, :nombre, :sede, :departamento_id, :cuenta_cimav
json.url persona_url(persona, format: :json)
