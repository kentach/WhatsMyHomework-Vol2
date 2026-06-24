class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :authenticate_user!, only: %i[ new create ]
  skip_before_action :authenticate_admin!, only: %i[ new create ]
  layout 'layouts/admin_login'

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to admin_root_path, notice: "ログインしました。"
    else
      flash.now[:danger] = "ログインできませんでした。"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path, status: :see_other, notice: "ログアウトしました。"
  end
end