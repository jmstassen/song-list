class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_songs_path(@user)
    else
      render :new
    end
  end

  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    @setlists = @user.setlists
    @songs = @user.songs
    redirect_to '/' if !@user
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_songs_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :display_name)
  end

end
