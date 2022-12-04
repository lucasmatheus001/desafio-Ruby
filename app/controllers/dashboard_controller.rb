class DashboardController < ApplicationController
  def index
    @account = Account.find_by(user_id: current_user.id)
    @user = current_user
  end
end
