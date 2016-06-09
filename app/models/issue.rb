# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  title       :string
#  status      :integer          default("open"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  content     :text
#  assignee_id :integer
#

class Issue < ApplicationRecord
  validates :content, presence: true, prohibited_word: true
  validates :title, presence: true, prohibited_word: true

  belongs_to :assignee, class_name: "User", foreign_key: :assignee_id, optional: true

  has_many :comments, -> { order(created_at: :asc) }, class_name: 'Comment'
  has_many :labelings, class_name: "Labeling", foreign_key: :issue_id, dependent: :destroy
  has_many :labels, through: :labelings, source: :label

  enum status: { close: 0, open: 1 }

  scope :with_label, ->(label_ids) {
    includes(:labels).where(labels: { id: label_ids })
  }

  def comment_count
    comments.length
  end
end
