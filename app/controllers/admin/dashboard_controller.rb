class User
	def first_name
		"Homer"
	end

	def last_name
		"Simpson"
	end
end

class Admin::DashboardController < AdminController

  def index
    @current_user = User.new
    @animals = Animal.all
  end

end
