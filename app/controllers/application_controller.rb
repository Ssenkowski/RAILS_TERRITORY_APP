class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_congregation
    @congregation = Congregation.find_by_id(params[:id])
    @congregation
  end
end
