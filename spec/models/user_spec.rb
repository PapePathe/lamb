require 'spec_helper'

describe User do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
  
  it { should(validate_presence_of :nom_complet) }
  it { should(validate_presence_of :email) }
  it { should(validate_uniqueness_of :email ) }

  it "overrides to_s"  do
    @user.to_s.should == @user.nom_complet
  end
  
  
  describe  "scopes" do
  
    let(:new_amateurs) { User.nouveaux }
    
    it "returns true" do
      new_amateurs.is_a?(ActiveRecord::Relation).should == true
    end
    
  end
  
end
# == Schema Information
#
# Table name: users
#
#  id                           :integer(4)      not null, primary key
#  email                        :string(255)
#  crypted_password             :string(255)
#  salt                         :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  remember_me_token            :string(255)
#  remember_me_token_expires_at :datetime
#  nom_complet                  :string(255)
#

