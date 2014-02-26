class MatchesController < ApplicationController
  def create
    Match.create(requester_id: current_user.id, responder_id: match_params[:responder_id], 
      requester_status: match_params[:requester_status])
    redirect_to root_path
  end

  def update
  end

  private

  def match_params
    params.permit(:responder_id, :requester_status)
  end
end
