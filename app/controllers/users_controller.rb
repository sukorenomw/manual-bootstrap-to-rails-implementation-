class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params_user)
  	if @user.save
  		flash[:notice] = "User successfully added!"
  		redirect_to action: "index"
  	else
  		flash[:error] = "data not valid"
        render 'new'
  	end
  end

  def edit
  end

   private
    def params_user
        params.require(:user).permit(:name, :email, :phone, :address)
    end
end
