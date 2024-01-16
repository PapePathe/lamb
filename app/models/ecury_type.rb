# == Schema Information
#
# Table name: ecury_types
#
#  id         :integer          not null, primary key
#  titre      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EcuryType < ActiveRecord::Base
  
  # Mass Assignment
  attr_accessible :titre
  
  # Validations
  validates :titre, :presence => true, :uniqueness => true
  
  # Associations
  has_many :ecuries
  
  # Instance methods
  
  # overrides to string
  def to_s
    titre
  end
  
end
