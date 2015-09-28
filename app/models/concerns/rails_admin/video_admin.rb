module RailsAdmin::VideoAdmin
  extend ActiveSupport::Concern
  included do
    rails_admin do
      list do
      end
    end
  end
end
