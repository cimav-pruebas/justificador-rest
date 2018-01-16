json.extract! moneda, :id, :code, :nombre, :simbolo, :created_at, :updated_at
json.url moneda_url(moneda, format: :json)
