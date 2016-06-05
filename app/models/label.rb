# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :string
#  color_code :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Label < ApplicationRecord
end
