class AddPartidaToJustificaciones < ActiveRecord::Migration[5.1]
  def change
    add_reference :justificaciones, :partida
  end
end
