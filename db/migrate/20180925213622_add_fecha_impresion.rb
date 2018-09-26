class AddFechaImpresion < ActiveRecord::Migration[5.1]
  def change
    add_column :justificaciones, :fecha_impresion, :date
  end
end
