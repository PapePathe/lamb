# == Schema Information
#
# Table name: promoteurs
#
#  id         :integer          not null, primary key
#  nom        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Promoteur < ActiveRecord::Base
  # Validations
  #
  validates :nom, :presence => true, :uniqueness => true

  # => Associations
  #
  # => Galas
  has_many :galas

  # => Tournois
  has_many :tournois

  # Override to_s
  #
  def to_s
    nom
  end
end
