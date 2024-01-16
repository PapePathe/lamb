# == Schema Information
#
# Table name: participants
#
#  id         :integer          not null, primary key
#  tournoi_id :integer
#  lutteur_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Participant < ActiveRecord::Base
  # Validations
  validates :tournoi_id, presence: true, numericality: true
  validates :lutteur_id, presence: true, numericality: true

  # Associations
  belongs_to :lutteur
  belongs_to :tournoi
end
