class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_users, only: [:edit, :update, :destroy]

  def index
    if params[:search] && !params[:search].empty?
      @users = User.search_all(params[:search])
    else
      @users = User.all
    end
   
  end

  def update_roles
    User.update_all(role: 'admin')
    redirect_to users_path, notice: 'Tous les utilisateurs sont maintenant des administrateurs.'
  end

  def new
    @users = User.new
  end

  def edit
  end

  def update
    if @users.update(users_params)
      redirect_to users_path, notice: 'users was successfully updated.'
    else
      render :new
    end
  end

  def create
    @users = User.new(users_params)
    @users.user_id = current_user.id
    if @users.save!
      redirect_to users_path, notice:  'User was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @users.destroy
    authorize @users
    redirect_to users_path, notice: 'user was successfully destroyed.'
  end

private
  def set_users
    @users = User.find(params[:id])
  end
  def users_params
     params.require(:user).permit(:email, :firstname, :lastname, :tel, :role)
  end
end

