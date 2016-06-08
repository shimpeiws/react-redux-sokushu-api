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

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :content, :created_at, :created, :updated_at, :updated

  belongs_to :issue_id

  include ActionView::Helpers::DateHelper

  def created
    I18n.t('time_ago', time: time_ago_in_words(object.created_at))
  end

  def updated
    I18n.t('time_ago', time: time_ago_in_words(object.updated_at))
  end
end
