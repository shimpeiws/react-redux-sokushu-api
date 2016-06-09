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

class IssueSerializer < ActiveModel::Serializer
  include DateTimeConcern

  attributes :id, :title, :status, :comment_count, :assignee, :created_at, :created, :updated_at, :updated, :content

  has_many :comments
  belongs_to :assignee, class_name: "User"
end
