require 'spec_helper'

describe Ecury do
  
  before(:each) do 
    @ecury = FactoryGirl.create(:ecury, { :nom => 'an ecury' })
  end  
  
  it { should_not(allow_mass_assignment_of :lutteurs_count) }
  
  it { should(allow_mass_assignment_of :nom) }
  
  it { should(validate_presence_of :nom) }
  
  it { should(validate_uniqueness_of :nom) }
  
  it { should have_many(:lutteurs)}
  
  it { should have_db_column(:ecury_type_id) }
  
  it { should(allow_mass_assignment_of :ecury_type_id) }
  
  it { should(validate_presence_of :ecury_type_id) }
  it { should(validate_numericality_of :ecury_type_id) }
  it { should belong_to(:ecury_type)}
  
  
  
  it "should override the to string method returning the name" do
    @ecury.to_s.should == @ecury.nom
  end
  
end
# == Schema Information
#
# Table name: ecuries
#
#  id             :integer(4)      not null, primary key
#  nom            :string(255)
#  lutteurs_count :integer(4)      default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  ecury_type_id  :integer(4)
#

