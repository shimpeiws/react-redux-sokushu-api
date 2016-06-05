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
  attributes :id, :user_name, :content, :created, :updated

  belongs_to :issue_id
end
