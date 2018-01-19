class AddIdentificadorToJustificaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :justificaciones, :identificador, :string
  end
end
