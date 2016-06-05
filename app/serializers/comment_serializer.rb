class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :content, :created, :updated

  belongs_to :issue_id
end
