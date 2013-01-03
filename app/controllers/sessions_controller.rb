class SessionsController < ApplicationController
  def new

  end

  def create
    zombie = Zombie.find_by_email(params[:email])
    if zombie && zombie.authenticate(params[:password])
    	session[:zombie_id] = zombie.id
    	redirect_to zombies_url, notice: "Logged in!"
    else
    	flash.now.alert = "Email or password is invalid."
      render "new" 
    end
  end

  def destroy
    session[:zombie_id] = nil
    redirect_to zombies_url, notice: "Logged out!"
  end
end
