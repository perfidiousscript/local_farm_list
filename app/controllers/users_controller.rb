class UsersController < ApplicationController
  skip_before_action :authenticate_request, :only => [:create]

  def create
    @user = User.new(user_params)
    render json: {message: "User #{@user.user_name} created"}, status: :created if @user.save
  end

  def update
  end

  def destroy
  end

  def show
    if @current_user.is_admin? or @current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render json: @user if @user
    else
      render json: {message: 'Cannot render user'}
    end
  end

  private

  def user_params
    params.permit(:user_name, :email, :password, :user_type, :latitude, :longitude)
  end

end
