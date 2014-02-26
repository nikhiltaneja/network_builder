class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @match = Match.find_by(requester_id: @user.id, responder_id: current_user.id)
  end
end
