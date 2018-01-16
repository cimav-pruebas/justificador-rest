class NetmultixRecord < ActiveRecord::Base

  #establish_connection :"#{Rails.env}_cimavnetmultix"
  establish_connection :"production_cimavnetmultix"

  self.abstract_class = true

end