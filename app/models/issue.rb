# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  title      :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Issue < ApplicationRecord
  has_many :comments, -> { order(created_at: :asc) }, class_name: 'Comment'

  enum status: { close: 0, open: 1 }

  def created
    created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  def updated
    updated_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  def comment_count
    comments.length
  end
end
