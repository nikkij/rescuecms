class Admin::SessionsController < AdminController
  layout "bare"

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:sessions][:email], params[:sessions][:password])
        format.html { redirect_to admin_root_path }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: 'Could not log you in.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end

  def session_params
    params.require(:sessions).permit(:email,:password)
  end
end