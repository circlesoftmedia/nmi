class Webmaster::UsersController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :authorize_admin
  load_and_authorize_resource
  layout 'webmaster'
  #before_filter :authenticate_user!
  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
  	 @user = User.find(params[:id])
  end

  def update
	  @user = User.find(params[:id])

	  if @user.update_attributes(params[:user])
	    redirect_to webmaster_user_url(@user)
	  else
	    render 'edit'
	  end
  end
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  protected
  # def authorize_admin
  #   authorize! :manage, :all
  # end

end
