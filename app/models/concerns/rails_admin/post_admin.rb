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
        COLUMN_NAMES = %i(post_type entry_id published_at link
          image_url author short_content image)
        field :id
        field :post_type do
          pretty_value do
            bindings[:object].post_type.nil? ? "normal" : bindings[:object].post_type
          end
        end
        field :image do
          pretty_value do
            url = bindings[:object].image.present? ? bindings[:object].image : "http://#{bindings[:object].image_url}"
            bindings[:view].tag(:img, {:src => url, width: "130", height: "120"})
          end
        end
        field :title
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
        field :post_type, :hidden do
          default_value do
            "normal"
          end
        end
      end

      show do
        COLUMN_NAMES = %i(post_type entry_id published_at link
          image_url author short_content image)
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
        COLUMN_NAMES.each do |column|
          field column do
            visible do
              bindings[:object].send(column).present?
            end
          end
        end
      end
    end
  end
end
