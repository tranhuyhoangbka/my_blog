Rails.application.eager_load!
RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.excluded_models = ["Image", "Article", "ArticleCategory", "Ckeditor::Asset"]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ["Activity"]
    end
    export
    bulk_delete
    show do
      except ["Activity"]
    end
    edit do
      except ["Activity"]
    end
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # (ActiveRecord::Base.descendants - [Ckeditor::Asset]).each do |imodel|
  #   config.model "#{imodel.name}" do
  #     list do
  #       exclude_fields :updated_at
  #     end
  #   end
  # end
end
