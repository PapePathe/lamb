require 'spec_helper'

describe Gala do
  
  before(:each) do
    @gala = FactoryGirl.create(:gala)
  end
  
  
  it { should allow_mass_assignment_of(:nom) }
  it { should allow_mass_assignment_of(:occurs_at) }
  it { should allow_mass_assignment_of(:promoteur_id) }
  it { should allow_mass_assignment_of(:featured) }
  it { should_not allow_mass_assignment_of(:promoteur) }
  
  it { should validate_presence_of(:nom) }
  it { should validate_presence_of(:promoteur_id) }
  it { should validate_numericality_of(:promoteur_id) }
  it { should validate_presence_of(:occurs_at) }
  
  it { should belong_to(:promoteur) }
  it { should have_many(:combats)}
  
  it "should override to string" do
    @gala.to_s.should == "#{@gala.nom}"
  end
  
  describe "named scope incoming" do
    
    let(:next_gala) { Gala.create :nom => 'drapeau xarala', :occurs_at => Date.tomorrow, :promoteur_id => Promoteur.create(:nom => 'promoteur 189').id }
    let(:next_galas) { Gala.incoming }
    
    it "should have 1 item in the incoming scope" do
      next_galas.count.should == 1
    end
    
    it "should include the next gala in the next_galas" do
      next_galas.include?(next_gala).should == true
    end 
    
  end
  
  
  
  describe "named scopes featured & not_featured" do
    
    let(:featured_gala) { Gala.create :nom => 'drapeau xarala 2', :featured => true, :occurs_at => Date.tomorrow, :promoteur_id => Promoteur.create(:nom => 'promoteur 18999').id }
    let(:featured_galas) { Gala.featured}
    
    it "should include the featured_gala in featured galas" do
      featured_galas.include?(featured_gala).should == true
    end
    
  end
  
  
end
# == Schema Information
#
# Table name: galas
#
#  id           :integer(4)      not null, primary key
#  nom          :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  occurs_at    :datetime
#  promoteur_id :integer(4)      not null
#  featured     :boolean(1)      default(FALSE)
#

