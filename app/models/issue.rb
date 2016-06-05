class Issue < ApplicationRecord
  has_many :comments, -> { order(created_at: :asc) }, class_name: 'Comment'
end
