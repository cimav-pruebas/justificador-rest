class Asistente < ApplicationRecord
  belongs_to :asistente, :class_name => "Persona"
  belongs_to :empleado, :class_name => "Persona"
end
