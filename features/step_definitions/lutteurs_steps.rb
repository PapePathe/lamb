Given /^I have vip lutteurs named (.+)$/ do |lutteurs|
  ndefleng = FactoryGirl.create :ecury , { :nom => 'ndefleng uyfgh' }
  lutteurs.split(',').each do |lutteur|
    Lutteur.create :surnom => lutteur, :vip => true, :ecury_id => ndefleng.id, :slogan => 'slogan'
  end

end


Given /^I have featured lutteurs named (.+)$/ do |lutteurs|
  ndefleng = FactoryGirl.create :ecury , { :nom => 'ndefleng 2 hdfh' }
  lutteurs.split(',').each do |lutteur|
    Lutteur.create :surnom => lutteur, :featured => true, :ecury_id => ndefleng.id
  end
end
