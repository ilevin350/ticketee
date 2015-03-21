# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
