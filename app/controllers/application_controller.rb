class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :new_posts, unless: :devise_controller?

  helper_method :all_categories
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :photo, :introduction]
  end

  def all_categories
    @categories = Category.all.order("order_ca")
  end

  def new_posts
    @new_posts ||= Post.order(created_at: :desc).limit 5
  end
end
