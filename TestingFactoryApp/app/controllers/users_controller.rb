class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(privates)
    if @user.save
      redirect_to @user
    else
      redirect_to :back
    end

  def show
    @user = User.find(params[:id])
  end

    Private
      def privates
        params.require(:user).permit(:first_name, :last_name, :email)
      end
  end
end
