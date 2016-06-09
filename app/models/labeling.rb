class Labeling < ApplicationRecord
  belongs_to :label_id
  belongs_to :issue_id
end
