Given /^I am a registered user$/ do
  @user = FactoryGirl.create(:user, :email => 'amateur@ndefleng.com')
end
