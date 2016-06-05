class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :created

  has_many :comments
end
