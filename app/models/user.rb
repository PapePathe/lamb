# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  email                        :string(255)
#  crypted_password             :string(255)
#  salt                         :string(255)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  remember_me_token            :string(255)
#  remember_me_token_expires_at :datetime
#  nom_complet                  :string(255)
#

class User < ActiveRecord::Base
  # Auth config
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :nom_complet

  # Validations
  #
  validates_confirmation_of :password
  validates :email, :presence => true, :uniqueness => true
  validates :nom_complet, :presence => true
  validates_presence_of :password, :on => :create

  # => Scopes
  #
  scope :nouveaux, limit(10).order('rand()')

  # instance methods

  def to_s
    nom_complet
  end
end
