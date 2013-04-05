When /^I log in with my github account$/ do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = {
    :info => { 
      :email   => 'test@user.com',
      :image   => "avatar_url",
      :name     => "Mr Test",
      :nickname => "testuser",
      :provider => "github",
      :uid      => "179491"
    }
  }
    

  visit '/'
  click_on 'Github!'
end

Given /^I am a logged user$/ do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = {
    :info => { 
      :email   => 'test@user.com',
      :image   => "avatar_url",
      :name     => "Mr Test",
      :nickname => "testuser",
      :provider => "github",
      :uid      => "179491"
    }
  }
    

  visit '/'
  click_on 'Github!'
end

When /^I logout of my account$/ do
  click_on 'Sair!'
end

Then /^I should not see my user details on the page$/ do
  page.should have_content "Github!"
  page.should_not have_content "testuser"
end

Then /^I should see my user details on the page$/ do
  page.should have_content "testuser"
end
