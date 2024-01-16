require 'spec_helper'

describe Participant do

  it "validates attrs"  do
    should validate_presence_of(:tournoi_id)
    should validate_presence_of(:lutteur_id)
    should validate_numericality_of(:tournoi_id)
  end

  it "has relations" do
    should belong_to(:lutteur)
    should belong_to(:tournoi)
  end

end
