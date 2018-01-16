class ChangeColMotivoSelection < ActiveRecord::Migration[5.1]
  def change
    rename_column :justificaciones, :motivo_selection, :motivo_seleccion
  end
end
