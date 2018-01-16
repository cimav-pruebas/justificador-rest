class ChangeNameToJustificiaciones < ActiveRecord::Migration[5.1]
  def change
    rename_table :justificacions, :justificaciones
  end
end
