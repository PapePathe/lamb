# == Schema Information
#
# Table name: combats
#
#  id              :integer          not null, primary key
#  occurs_at       :datetime
#  challenger_id   :integer
#  champion_id     :integer
#  fightable_id    :integer
#  fightable_type  :string(255)
#  featured        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  grand_combat    :boolean          default(FALSE)
#  vainqueur_id    :integer          default(0)
#  verdict_declare :boolean          default(FALSE)
#  video           :string(255)
#

class Combat < ActiveRecord::Base
  
  # => Constant Definition
  #
  # Fightable models should be declared here
  FIGHTABLES = ["Gala"]
    
  # => Mass Assignment
  #
  attr_accessible :challenger_id, :champion_id, :fightable_id, :fightable_type, :occurs_at, :challenger, :champion, :grand_combat, :fightable, :featured, :verdict_declare, :vainqueur_id
  
  # => Validations
  #
  validates :challenger_id, :champion_id, :fightable_id, :fightable_type, :occurs_at, :presence => true  
  validates :challenger_id, :champion_id, :fightable_id, :numericality => true
  
  # => Associations
  #
  
  belongs_to :champion, :class_name => "Lutteur"
  belongs_to :challenger, :class_name => "Lutteur"
  belongs_to :fightable, :polymorphic => true
  belongs_to :vainqueur, :class_name => "Lutteur"
    
  # => Scopes
  #
  
  # => combats promus
  scope :featured, where('featured = ?', true)
  
  # => prochains combats
  scope :incoming, where('occurs_at >= ?', Date.today)
  
  # => recent combats
  scope :recent, where('occurs_at <= ?', Date.today)
  
  # Les combats dont le verdict a été déclaré
  #
  scope :verdict_declares, where('verdict_declare = ?', true)

  # => Instance Methods
  
  # => Titre
  # Returns the title of the combat Pattern (champion contre challenger)
  #
  def titre
    "#{champion} contre #{challenger}"
  end  
  
  # => To String
  #
  def to_s
    titre
  end
  
end
