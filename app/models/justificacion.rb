class Justificacion < ApplicationRecord
  belongs_to :tipo
  belongs_to :moneda
  belongs_to :empleado, class_name: 'Persona',  foreign_key: :empleado_id
  belongs_to :autoriza, class_name: 'Persona',  foreign_key: :empleado_autorizo_id
  belongs_to :elabora, class_name: 'Persona',  foreign_key: :empleado_elaboro_id
  belongs_to :partida, class_name: 'Partida',  foreign_key: :partida_id

  attr_accessor :biensServicios

  def biensServicios
    if bien_servicio == 0
      return 'bienes'
    end
    return 'servicios'
  end


end
