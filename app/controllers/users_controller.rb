class UsersController < ApplicationController
  def index
    @users = User.limit(36)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "votre compte a ete cree"
      redirect_to root_url
    else
      render :new
    end
  end
end
