class UsersController < ApplicationController
  skip_before_action :authenticate_request, :only => [:create]

  def create
    @user = User.new(user_params)
    render json: {message: "User #{@user.user_name} created"}, status: :created if @user.save
  end

  def update
    if @current_user.is_admin?
      @update_user = User.find(params[:id])
    else
      @update_user = @current_user
    end
    render json: @update_user if @update_user.update(user_params)
  end

  def destroy
  end

  def show
    if @current_user.is_admin?
      @user = User.find(params[:id])
      render json: @user if @user
    else
      render json: @current_user
    end
  end

  private

  def user_params
    params.permit(:user_name, :email, :password, :user_type, :latitude, :longitude)
  end

end
