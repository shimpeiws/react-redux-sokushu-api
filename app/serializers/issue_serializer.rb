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
  attributes :id, :title, :status, :comment_count, :created, :updated

  has_many :comments
end
