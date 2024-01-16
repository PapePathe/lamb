# == Schema Information
#
# Table name: galas
#
#  id           :integer          not null, primary key
#  nom          :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  occurs_at    :datetime
#  promoteur_id :integer          not null
#  featured     :boolean          default(FALSE)
#

class Gala < ActiveRecord::Base
  # Attrs that can be mass-assigned!
  #
  attr_accessible :nom, :occurs_at, :promoteur_id, :featured

  # Validations
  #

  validates :nom, :presence => true
  validates :promoteur_id, :presence => true,  :numericality => true
  validates :occurs_at, :presence => true

  # Associations
  #
  belongs_to  :promoteur
  has_many :combats, :as => :fightable do
    def grand_combat
      select { |c| c.featured? }.first
    end

    def others
      select { |c| c.featured? == false }
    end
  end

  # Scopes
  #
  scope :incoming, where("occurs_at >= ?", Date.today)
  scope :featured, where("featured = ?", true)

  # Instance Methods

  # override to string
  #
  def to_s
    "#{nom}"
  end
end
