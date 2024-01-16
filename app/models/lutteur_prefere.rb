# == Schema Information
#
# Table name: lutteur_preferes
#
#  id         :integer          not null, primary key
#  lutteur_id :integer
#  amateur_id :integer
#

class LutteurPrefere < ActiveRecord::Base
  # Validations
  validates :lutteur_id, presence: true, numericality: true
  validates :amateur_id, presence: true, numericality: true

  # Associations
  belongs_to :lutteur
  belongs_to :amateur, class_name: User, foreign_key: 'amateur_id'
end
