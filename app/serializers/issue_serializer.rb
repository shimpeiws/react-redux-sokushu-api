class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :comment_count, :created, :updated

  has_many :comments
end
