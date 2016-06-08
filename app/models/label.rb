# == Schema Information
#
# Table name: labels
#
#  id         :integer          not null, primary key
#  name       :string
#  color_code :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Label < ApplicationRecord
  validates :name, presence: true
  validates :color_code, presence: true

  validate :color_code_check

  private
  def color_code_check
    errors.add(:base, :invalid_color) unless hexadecimal_color_code?(color_code)
  end

  def hexadecimal_color_code?(color_code)
    return false unless color_code
    /^#(?:[0-9a-f]{3})(?:[0-9a-f]{3})?$/i.match(color_code).present?
  end
end
