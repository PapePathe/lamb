require 'spec_helper'

describe Promoteur do
  
  before(:each) do
    @promoteur = FactoryGirl.create(:promoteur)
  end
  
  
  it { should allow_mass_assignment_of(:nom) }
  it { should validate_presence_of(:nom) }
  it { should validate_uniqueness_of(:nom) }
  
  it { should have_many(:galas)}
  it { should have_many(:tournois)}
  
  it "should override the to_s method returning the name of the promoteur" do
    @promoteur.to_s.should == @promoteur.nom
  end  
  
end
# == Schema Information
#
# Table name: promoteurs
#
#  id         :integer(4)      not null, primary key
#  nom        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

