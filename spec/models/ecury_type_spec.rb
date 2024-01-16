require 'spec_helper'

describe EcuryType do
  
  before(:each) do
    @ecury_type = FactoryGirl.create(:ecury_type)
  end
  
  it { should allow_mass_assignment_of(:titre) }
  it { should validate_presence_of(:titre) }
  it { should validate_uniqueness_of(:titre) }
  it { should have_many(:ecuries) }
  
  
  it "should override to string returning titre" do
    (@ecury_type.to_s == @ecury_type.titre).should == true
  end
  
end
# == Schema Information
#
# Table name: ecury_types
#
#  id         :integer(4)      not null, primary key
#  titre      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

