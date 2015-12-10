class FriendsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new
    @friend.friend_id = params[:friend_id]
    @friend.user_id = params[:user_id]

    if @friend.save
      redirect_to "/friends", :notice => "Friend created successfully."
    else
      render 'new'
    end
  end


  def destroy
    @friend = Friend.find(params[:id])

    if (@friend.user_id == current_user.id)

      @friend.destroy

      redirect_to "/friends", :notice => "Friend deleted."

    else
      redirect_to "/friends", :alert => "Access Denied"
    end
  end
end
