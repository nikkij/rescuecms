class Admin::UsersController < AdminController
  before_filter :require_login
  before_action :set_user, only: [:show]
  
  def index
    @users = User.all
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    # if @user.save
    # 	redirect_to admin_root_url, :notice => 'Signed Up!'
    # else
    #   render :new
    # end
    respond_to do |format|
      if @user.save
        format.html { redirect_to [:admin,@user], notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end

end