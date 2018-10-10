class AttendsController < ApplicationController

  def create
    Attend.create(user_id: params[:user_id], event_id: params[:event_id])
    redirect_to "/events"
  end

  def destroy
    attend = Attend.where("user_id = ? AND event_id = ?", params[:user_id], params[:event_id])
    # user = User.find(params[:user_id])
    # event = Event.find(params[:event_id])
    Attend.delete(attend)
    # Attend.where('user_id = :user_id AND event_id = :event_id', params).destroy
    redirect_to "/events"
  end

end
