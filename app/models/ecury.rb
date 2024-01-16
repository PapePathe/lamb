# == Schema Information
#
# Table name: ecuries
#
#  id             :integer          not null, primary key
#  nom            :string(255)
#  lutteurs_count :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ecury_type_id  :integer
#

class Ecury < ActiveRecord::Base
  
  # Mass Assigned Attributes
  #
  attr_accessible :nom, :ecury_type_id
  
  # Validations
  #
  
  validates :nom, :presence => true, :uniqueness => true
  validates :ecury_type_id, :presence => true, :numericality => true
  
  
  # Associations
  #
  
  has_many :lutteurs do 
    
    def featured
      select { |lutteur| lutteur.featured? }
    end
    
    def not_featured
      select { |lutteur| !lutteur.featured? }
    end
    
  end
  
  belongs_to :ecury_type

  # Scopes
  
  # Instance methods
  #
  
  def to_s
    nom
  end
  
  
end
