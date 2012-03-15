# encoding: UTF-8
class BilanSanguin < ActiveRecord::Base
  belongs_to :bilanable, :polymorphic => true
  validates_presence_of :date_of_bilan
  
  def bilan_type_enum
    ['Glycémie', 'Tryglycérides', 'Cholestérol', 'HDL', 'LDL', 'T4L', 'TSH']
  end
  
  def glycemie_enum
    ['faible', 'normal', 'élevé']
  end
  def tryglycerides_enum
    ['faible', 'normal', 'élevé']
  end
  def cholesterol_enum
    ['faible', 'normal', 'élevé']
  end
  def hdl_enum
    ['faible', 'normal', 'élevé']
  end
  def ldl_enum
    ['faible', 'normal', 'élevé']
  end
  def _enum
    ['faible', 'normal', 'élevé']
  end
  def t4l_enum
    ['faible', 'normal', 'élevé']
  end
  def tsh_enum
    ['faible', 'normal', 'élevé']
  end
end
