class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
      @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path
    else
        render :edit
    end
  end

  def edit 
  end

  def update 
      if @user.update(user_params)
          redirect_to users_path
      else
          render :edit
      end
  end

  def destroy 
    # #   @user.destroy
    #     @user.update(status: "excluido")
    #   redirect_to users_path
  end

  private

  def set_user
      @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:name, :email, :cpf, :birthday)
  end
end
