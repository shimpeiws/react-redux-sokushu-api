# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true, prohibited_word: true

  has_many :issues, class_name: "Issue", foreign_key: :assignee_id
end
