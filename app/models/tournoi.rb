# == Schema Information
#
# Table name: tournois
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  description    :text
#  promoteur_id   :integer
#  editions_count :integer          default(1)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  short_title    :string(255)
#

class Tournoi < ActiveRecord::Base
  # => Validations
  # => Title
  # presence
  # uniqueness
  validates :title, presence: true, uniqueness: true

  # => ShortTitle
  # presence
  # length
  validates :short_title, presence: true

  # => Description
  # presence
  validates :description, presence: true

  # => PromoteurId
  # presence
  # numericality
  validates :promoteur_id, presence: true, numericality: true


  # => Associations

  # => Promoteur
  belongs_to :promoteur

  # => Participants
  has_many :participants

  # => Lutteurs
  has_many :lutteurs, :through => :participants
end
