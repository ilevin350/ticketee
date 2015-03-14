require 'byebug'

Given(/^there is a project called "(.*?)"$/) do |name|
	prj = FactoryGirl.create(:project)
end
