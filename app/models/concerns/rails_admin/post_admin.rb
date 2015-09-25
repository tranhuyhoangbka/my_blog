module RailsAdmin::PostAdmin
  extend ActiveSupport::Concern
  included do
    rails_admin do
      list do
        field :id
        field :title
        field :content
        field :category
        field :image
        field :created_at do
          label "Create on"
        end
      end

      edit do
        field :title
        field :content, :ck_editor
        field :category
        field :image
      end

      show do
        field :title
        field :content do
          sanitize
        end
        field :category
        field :image
      end
    end
  end
end
