class CreateJustificacions < ActiveRecord::Migration[5.1]
  def change
    create_table :justificaciones do |t|
      t.integer :empleado_id
      t.references :tipo, foreign_key: true
      t.integer :empleado_elaboro_id
      t.integer :empleado_autorizo_id
      t.string :requisicion
      t.string :proyecto
      t.string :proveedor_uno
      t.string :proveedor_dos
      t.string :proveedor_tres
      t.integer :bien_servicio
      t.decimal :subtotal
      t.decimal :iva
      t.decimal :importe
      t.text :condiciones_pago
      t.string :datosbanco
      t.text :razoncompra
      t.string :terminos_entrega
      t.string :plazo_entrega
      t.string :rfc
      t.string :curp
      t.string :telefono
      t.string :email
      t.date :fecha_inicio
      t.date :fecha_termino
      t.date :fecha_elaboracion
      t.text :descripcion
      t.decimal :monto_uno
      t.decimal :monto_dos
      t.decimal :monto_tres
      t.string :domicilio
      t.references :moneda, foreign_key: true
      t.boolean :es_unico
      t.integer :plazo
      t.integer :num_pagos
      t.integer :porcen_anticipo
      t.string :autoriza_cargo
      t.string :forma_pago
      t.integer :num_dias_plazo
      t.text :motivo_selection
      t.boolean :es_nacional

      t.timestamps
    end
  end
end
