require 'spec_helper'

describe Combat do
  
  before(:each) do
    champion = FactoryGirl.create :lutteur, :surnom => Faker::NameSN.name_sn
    challenger = FactoryGirl.create :lutteur, :surnom => Faker::NameSN.name_sn
    @combat = FactoryGirl.create(:combat, :challenger => challenger, :champion => champion)
  end
  
  it { should allow_mass_assignment_of(:challenger_id) }
  it { should allow_mass_assignment_of(:challenger) }
  it { should allow_mass_assignment_of(:champion) }
  it { should allow_mass_assignment_of(:champion_id) }
  it { should allow_mass_assignment_of(:fightable_id) }
  it { should allow_mass_assignment_of(:fightable) }
  it { should allow_mass_assignment_of(:fightable_type) }
  it { should allow_mass_assignment_of(:occurs_at) }
  it { should allow_mass_assignment_of(:grand_combat) }
  it { should allow_mass_assignment_of(:featured) }
  it { should allow_mass_assignment_of(:vainqueur_id) }
  it { should allow_mass_assignment_of(:verdict_declare) }
  
  
  it { should validate_presence_of(:challenger_id) }
  it { should validate_presence_of(:champion_id) }
  it { should validate_presence_of(:fightable_id) }
  it { should validate_presence_of(:fightable_type) }
  it { should validate_presence_of(:occurs_at) }
  
  it { should validate_numericality_of(:challenger_id) }
  it { should validate_numericality_of(:champion_id) }
  it { should validate_numericality_of(:fightable_id) }
  
  it { should belong_to(:fightable) }
  it { should belong_to(:champion) }
  it { should belong_to(:challenger) }
  it { should belong_to(:vainqueur) }

  it "should have an instance method titre" do
    (@combat.titre == "#{@combat.champion} contre #{@combat.challenger}").should == true
  end
  
  it "should override to string" do
    (@combat.to_s == @combat.titre).should == true
  end
  
  describe "sould have a scope: featured " do
  
    let(:featured_combats) { Combat.featured }
    let(:incoming_combats) { Combat.incoming }
    let(:recent_combats) { Combat.recent }
    
    
    it "should return true" do
      featured_combats.is_a?(ActiveRecord::Relation).should == true
      incoming_combats.is_a?(ActiveRecord::Relation).should == true
      recent_combats.is_a?(ActiveRecord::Relation).should == true
    end
    
  end  

  it "should have a constant FIGHTABLES" do
    Combat::FIGHTABLES.is_a?(Array).should == true
    Combat::FIGHTABLES.include?("Gala").should == true
  end
  
  
  
  
end
# == Schema Information
#
# Table name: combats
#
#  id              :integer(4)      not null, primary key
#  occurs_at       :datetime
#  challenger_id   :integer(4)
#  champion_id     :integer(4)
#  fightable_id    :integer(4)
#  fightable_type  :string(255)
#  featured        :boolean(1)      default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#  grand_combat    :boolean(1)      default(FALSE)
#  vainqueur_id    :integer(4)
#  verdict_declare :boolean(1)      default(FALSE)
#  video           :string(255)
#

