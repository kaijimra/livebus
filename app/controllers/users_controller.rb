class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    @pagy, @users = pagy(User.order(id: :asc), items: 25)
  end

  def show
    @user = User.find(params[:id])
  end

#  def new
#    @user = User.new
#  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = '管理者を登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '管理者の登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end