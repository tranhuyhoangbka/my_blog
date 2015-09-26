module RailsAdmin::PostAdmin
  extend ActiveSupport::Concern
  included do
    rails_admin do

      label "Quản lý bài viết"
      label_plural "Quản lý bài viết"

      configure :article_categories do
        visible(false)
      end

      list do
        field :id
        field :title
        field :image
        field :categories
        field :created_at do
          label "Created on"
          strftime_format "Lúc %I:%M %p Ngày %d-%m-%Y"
        end
      end

      edit do
        field :id do
          read_only true
        end
        field :created_at do
          strftime_format "Lúc %I:%M %p Ngày %d-%m-%Y"
          read_only true
        end
        field :title
        field :content, :ck_editor
        field :image do
          thumb_method :thumb
        end
        field :categories
      end

      show do
        field :created_at do
          strftime_format "Lúc %I:%M %p Ngày %d-%m-%Y"
          label "Create on"
        end
        field :id
        field :title
        field :content do
          formatted_value do
            value.html_safe
          end
        end
        field :image
      end
    end
  end
end
