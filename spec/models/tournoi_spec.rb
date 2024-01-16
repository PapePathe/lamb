require 'spec_helper'

describe Tournoi do
  
  before(:each) do
    @tournoi = FactoryGirl.create(:tournoi)
  end
  
  it "validates attributes" do
    should(validate_presence_of :title)
    should(validate_uniqueness_of :title)
    should(validate_presence_of :short_title)
    should(validate_presence_of :description)
    should(validate_presence_of :promoteur_id)
    should(validate_numericality_of :promoteur_id)
  end
  
  it "belongs to promoteur" do
    should belong_to(:promoteur)
  end
  
   it "should have many participants" do
    should have_many(:participants)
    should have_many(:lutteurs).through(:participants)
   end
  
end
# == Schema Information
#
# Table name: tournois
#
#  id             :integer(4)      not null, primary key
#  title          :string(255)
#  description    :text
#  promoteur_id   :integer(4)
#  editions_count :integer(4)      default(1)
#  created_at     :datetime
#  updated_at     :datetime
#

