class Admin::DashboardController < AdminController
  before_filter :require_login
  
  def index
    @animals = Animal.all
    @activities = PublicActivity::Activity.order("created_at desc").take 5
  end

end
