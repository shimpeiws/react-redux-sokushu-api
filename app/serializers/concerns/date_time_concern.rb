module DateTimeConcern
  extend ActiveSupport::Concern
  include ActionView::Helpers::DateHelper
  
  included do
    def created
      I18n.t('time_ago', time: time_ago_in_words(object.created_at))
    end

    def updated
      I18n.t('time_ago', time: time_ago_in_words(object.updated_at))
    end
  end
end
