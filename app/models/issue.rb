# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  title      :string
#  status     :integer          default("open"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#

class Issue < ApplicationRecord
  validates :content, presence: true, prohibited_word: true
  validates :title, presence: true, prohibited_word: true

  has_many :comments, -> { order(created_at: :asc) }, class_name: 'Comment'

  enum status: { close: 0, open: 1 }

  def comment_count
    comments.length
  end
end
