class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @page_title = "Dashboard"
  end
end
