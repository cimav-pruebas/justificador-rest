class CreateAsistentes < ActiveRecord::Migration[5.1]
  def change
    create_table :asistentes do |t|
      t.references :asistente
      t.references :empleado
    end

  end
end
