require 'byebug'

Given(/^there is a project called "(.*?)"$/) do |name|
	@project = FactoryGirl.create(:project, {payload: {name: name}})
end
