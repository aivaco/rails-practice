class Users::EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit_user, :update_user, :delete_user]
  
    
  def index
    @users =  policy_scope(User)
  end
  
  def new_user
      @user = User.new
      authorize @user
  end
  
  def create_user
    @user = User.new(user_params)
    authorize @user
    if params[:role] == '1'
        @user.role = 1
    else
        @user.role = 0
    end
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to employees_path, notice: 'Employee was successfully created.' }
      else
        format.html { render :new_user }
      end
    end
  end

  def edit_user
    authorize @user
  end
  
  def update_user
    authorize @user
    respond_to do |format|
      if params[:role] == '1'
        @user.role = 1
      else
        @user.role = 0
      end
      if @user.update(user_params)
        format.html { redirect_to employees_path, notice: 'Employee was successfully updated.' }
      else
        format.html { render :edit_user }
      end
    end
  end
  
  def delete_user
    authorize @user
    @user.appointments.destroy_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to employees_path, notice: 'Employee was successfully destroyed.' }
    end
  end
  
  private

  def set_user
      @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

end
