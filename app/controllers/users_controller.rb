class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "User #{@user.name} was created successfully! Please Sign In to fill your basket."
      redirect_to '/'
    else
      render 'new'
    end
  end

end
