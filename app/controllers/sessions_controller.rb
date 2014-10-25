class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash.present?

      oauth = OAuthUser.new(auth_hash, current_user)
      oauth.login_or_create
      session[:user_id] = oauth.user.id
      redirect_to root_path

    else
      user = RegularUser.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to root_path

      else
        flash.new[:error] = "Invalid login credentials."
        render action: "new"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
