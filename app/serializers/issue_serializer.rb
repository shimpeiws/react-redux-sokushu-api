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

class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :comment_count, :created_at, :created, :updated_at, :updated

  has_many :comments

  include ActionView::Helpers::DateHelper

  def created
    time_ago_in_words(object.created_at) + ' ago'
  end

  def updated
    time_ago_in_words(object.updated_at) + ' ago'
  end
end
