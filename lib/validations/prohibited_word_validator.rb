class ProhibitedWordValidator < ActiveModel::EachValidator
  PROHIBITED_WORD = "ERROR"

  def validate_each(record, attribute, value)
    record.errors.add(:base, "Prohibited word is included!") if value.present? && value.include?(PROHIBITED_WORD)
  end
end
