class Api::V1::BaseController < ActionController::Base
  respond_to :json, :xml

  before_action :token_authenticate_user

  private

  def token_authenticate_user
    @current_user = User.find_by authentication_token: params[:token]
    respond_with({"error" => "token is invalid"})  unless @current_user
  end

  def current_user
    @current_user
  end
end
