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
  include DateTimeConcern

  attributes :id, :user_name, :content, :created_at, :created, :updated_at, :updated

  belongs_to :issue_id
end
