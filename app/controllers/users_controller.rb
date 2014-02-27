class UsersController < ApplicationController
  def index
    if current_user
      @users = User.potential_matches(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @match = Match.find_by(requester_id: @user.id, responder_id: current_user.id) || Match.find_by(requester_id: current_user.id, responder_id: @user.id) 
  end
end
