class Tipo < ApplicationRecord

  attr_accessor :romano

  def romano
    case fraccion
      when 3
        "III"
      when 14
        "XIV"
      when 15
        "XV"
      when 17
        "XVII"
    end
  end

end
