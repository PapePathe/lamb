require 'spec_helper'

describe LutteurPrefere do

  before(:each) do
    @lutteur_prefere = FactoryGirl.create(:lutteur_prefere)
  end

  it "does validate " do

    should( validate_presence_of :lutteur_id )
    should( validate_presence_of :amateur_id )

    should( validate_numericality_of :lutteur_id )
    should( validate_numericality_of :amateur_id )

  end

  it "is related to others"  do
    should( belong_to :lutteur )
    should( belong_to :amateur )
  end


end
