# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_name  :string
#  content    :string
#  issue_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :content, presence: true, prohibited_word: true
  validates :user_name, presence: true, prohibited_word: true

  belongs_to :issue
end
