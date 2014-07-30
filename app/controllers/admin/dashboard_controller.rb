class Admin::DashboardController < AdminController
  before_filter :require_login
  
  def index
    @animals = Animal.all.take 4
    @activities = PublicActivity::Activity.all.take 5
  end

end
