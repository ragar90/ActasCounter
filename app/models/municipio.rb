class Municipio < ActiveRecord::Base
  belongs_to :departamento
  attr_accessible :from_actum, :name, :num, :to_actum, :departamento_id
end
