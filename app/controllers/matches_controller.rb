class MatchesController < ApplicationController
  def create
    Match.create(
      requester_id: current_user.id,
      responder_id: match_params[:responder_id], 
      requester_status: match_params[:requester_status]
      )
    redirect_to root_path
  end

  def update
    match = Match.find(params[:id])
    match.update_attributes(
      responder_status: match_params[:responder_status],
      status: match_params[:status]
      )
    if match.status == "accepted"
      UserMailer.match_confirmation(match.requester_id, match.responder_id).deliver
    end
    redirect_to root_path
  end

  def require_responses
    @responses = current_user.responses.where(status: 'pending')
  end

  def completed
    @matches = Match.where(status: 'accepted').includes(:requester, :responder)
  end

  def outstanding_requests
    @requests = current_user.requests.where(status: 'pending')
  end

  private

  def match_params
    params.permit(:responder_id, :requester_status, :responder_status, :status)
  end
end
