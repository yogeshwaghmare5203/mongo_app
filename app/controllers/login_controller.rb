class LoginController < ApplicationController

  def create
    user = User.authenticate(params[:user][:email], params[:password])
    respond_to do |format|
    if user
      session[:user_id] = user.id
     format.html {redirect_to :action => "welcome", :id => session[:user_id]}
     format.json { render :json => user, :status => created, :location=> user }
    else
      format.html {render "new"}
    end
    end

  end

  def welcome
    @id = params[:id]
    @welcome_user = User.find(@id)
    render :layout =>false
  end
end
