class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @page_title = "Dashboard"
    @groups = Group.includes(:operations).order(:name)
  end
end
