class ChangePrecisionJustificaciones < ActiveRecord::Migration[5.1]
  def change
    change_column :justificaciones, :subtotal, :decimal, :precision=>10, :scale=>2
    change_column :justificaciones, :iva, :decimal, :precision=>10, :scale=>2
    change_column :justificaciones, :importe, :decimal, :precision=>10, :scale=>2
    change_column :justificaciones, :monto_uno, :decimal, :precision=>10, :scale=>2
    change_column :justificaciones, :monto_dos, :decimal, :precision=>10, :scale=>2
    change_column :justificaciones, :monto_tres, :decimal, :precision=>10, :scale=>2
  end
end
