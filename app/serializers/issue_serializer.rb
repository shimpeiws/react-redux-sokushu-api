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
    I18n.t('time_ago', time: time_ago_in_words(object.created_at))
  end

  def updated
    I18n.t('time_ago', time: time_ago_in_words(object.updated_at))
  end
end
