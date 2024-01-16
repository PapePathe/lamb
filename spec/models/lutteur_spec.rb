require 'spec_helper'

describe Lutteur do
  
  before(:each) do
    @lutteur = FactoryGirl.create(:lutteur)
  end
  
  it { should( validate_presence_of :surnom ) }
  it { should( validate_uniqueness_of :surnom ) }
  it { should( validate_presence_of :ecury_id ) }
  it { should( validate_numericality_of :ecury_id ) }
  
  it { should allow_mass_assignment_of(:featured) }
  it { should allow_mass_assignment_of(:surnom) }
  it { should allow_mass_assignment_of(:ecury_id) }
  it { should allow_mass_assignment_of(:vip) }
  it { should allow_mass_assignment_of(:slogan) }
  
  
  it { should( belong_to :ecury ) }
  it { should( have_many :challengers)}
  it { should( have_many :champions)}
  
  
  it "should override the to string method returning the surnom" do
    @lutteur.to_s.should == @lutteur.surnom
  end
  
  it "should have instance method combats" do
    #@lutteur.combats.class.should == ActiveRecord::Relation
  end
  
  describe "scopes" do
        
    let(:vip) { FactoryGirl.create(:lutteur, {:surnom => "a_vip", :vip => true, :ecury_id => 1}) }
    let(:not_a_vip) { FactoryGirl.create(:lutteur, {:surnom => "not_a_vip", :vip => false, :ecury_id => 1}) }
    let(:vips) { Lutteur.vips }
    let(:not_vips) { Lutteur.not_vips }
    
    it "should include the vip in vips array" do
      vips.include?(vip).should == true
    end

    it "should include the vip in vips array" do
      not_vips.include?(not_a_vip).should == true
    end
        
    it "should not include the not_a_vip lutteur in vips array" do
      vips.include?(not_a_vip).should == false
    end
    
    it "should not include the vip in not_vips array" do
     not_vips.include?(vip).should == false
    end
    
    
    let(:featured) { FactoryGirl.create(:lutteur, {:surnom => "a_featured", :featured => true, :ecury_id => 1}) }
    let(:featured_lutteurs) { Lutteur.featured }
    let(:not_featured_lutteurs) { Lutteur.not_featured }
    
    it "should include the a_featured in the featured_lutteurs array" do
      featured_lutteurs.include?(featured).should == true
    end
    
    it "should not include the a_featured in the not_featured_lutteurs array" do
      not_featured_lutteurs.include?(featured).should == false
    end
    
        
  end
  
end
# == Schema Information
#
# Table name: lutteurs
#
#  id         :integer(4)      not null, primary key
#  surnom     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  vip        :boolean(1)      default(FALSE)
#  ecury_id   :integer(4)
#  featured   :boolean(1)      default(FALSE)
#  slogan     :string(255)
#

