# == Schema Information
#
# Table name: lutteurs
#
#  id         :integer          not null, primary key
#  surnom     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vip        :boolean          default(FALSE)
#  ecury_id   :integer
#  featured   :boolean          default(FALSE)
#  slogan     :string(255)
#

class Lutteur < ActiveRecord::Base
  # Attrs that can be mass assigned!
  #
  attr_accessible :surnom, :vip, :ecury_id, :featured, :slogan

  # Validations
  #
  validates :surnom,   :presence => true,     :uniqueness => true
  validates :ecury_id, :numericality => true, :presence => true


  # Associations
  #
  belongs_to :ecury, :counter_cache => true
  has_many :challengers, :class_name => "Combat", :foreign_key => 'challenger_id'
  has_many :champions,   :class_name => "Combat", :foreign_key => 'champion_id'

  # Scopes
  #

  # Vips are top level wrestlers
  #
  scope :vips, where("vip = ?", true)
  scope :not_vips, where("vip = ?", false)

  # Featureds are upto be vips
  #
  scope :featured, where('featured = ?', true )
  scope :not_featured, where('featured = ?', false )

  # => Instance Methods
  #

  # => combats
  #
  def combats
    combats ||= Combat.verdict_declares.where('challenger_id = ? OR champion_id = ?', id, id)
  end

  # => victoires
  #
  def victoires
    victoires ||= Combat.includes([:challenger, :champion, :fightable]).where('vainqueur_id = ?', id)
  end

  # => defaites
  #
  def defaites
    defaites ||= combats.includes([:challenger, :champion, :fightable]).where('vainqueur_id != ? and vainqueur_id != 0',  id)
  end

  # => match nuls
  #
  def match_nuls
    match_nuls ||= combats.includes([:challenger, :champion, :fightable]).where('vainqueur_id = ?', 0)
  end

  # override to_s
  #
  def to_s
    surnom
  end
end
