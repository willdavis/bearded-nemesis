class Admin::UsersController < ApplicationController
  skip_before_filter :authenticate
  load_and_authorize_resource
  
  # GET /users
  # GET /users.json
  def index
    @users = User.order("current_sign_in_at DESC").all
    @recently_active = User.where("current_sign_in_at > ?", Time.now-7.days).order("current_sign_in_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to :back, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, notice: 'Update Error: User was not successfully updated.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
