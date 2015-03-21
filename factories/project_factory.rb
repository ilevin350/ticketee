require 'byebug'

FactoryGirl.define do
	factory :project do
		transient do
			name "TextMate 2"
		end
		initialize_with do
			new(name: payload[:name])
		end
	end
end