class PostsController < ApplicationController
  before_action :load_category, :load_post

  def show
  end

  private

  def load_category
    @category = Category.find params[:category_id]
  end

  def load_post
    @post = @category.posts.find params[:id]
  end
end
