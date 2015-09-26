module RailsAdmin::CategoryAdmin
  extend ActiveSupport::Concern
  included do
    rails_admin do
      label "Quản lý loại bài viết"
      label_plural "Quản lý loại bài viết"

      configure :article_categories do
        visible(false)
      end

      list do
        field :id
        field :name
        field :description
        field :image
      end

      edit do
        field :id do
          read_only true
        end
        field :name
        field :description
        field :image
        field :posts
      end

      show do
        field :id
        field :name
        field :description
        field :image
        field :posts
      end
    end
  end
end
