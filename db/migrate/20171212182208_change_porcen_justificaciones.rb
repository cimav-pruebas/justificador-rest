class ChangePorcenJustificaciones < ActiveRecord::Migration[5.1]
  def change
    change_column :justificaciones, :porcen_anticipo, :integer
  end
end
