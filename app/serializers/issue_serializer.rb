# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  title      :string
#  status     :integer          default("open"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#

class IssueSerializer < ActiveModel::Serializer
  include DateTimeConcern

  attributes :id, :title, :status, :comment_count, :created_at, :created, :updated_at, :updated

  has_many :comments
end
