class UsersController < ApplicationController

  def editcurrentlist

    @user = current_user

  end

  def showcurrentlist

    @user = current_user

  end

  def showfriendlist
   if !Friend.find_by(:user_id => params[:id], :friend_id => current_user.id).nil?
    @user = User.find(params[:id])
  else
    redirect_to "/friends", :alert => "Access Denied"
  end
end

def showdefaultlist

end

def itemmanager

end

end
