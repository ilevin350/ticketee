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

class Ticket < ActiveRecord::Base
  belongs_to :project
end
