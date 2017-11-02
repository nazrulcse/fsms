class TrackingsController < ApplicationController
  def index
    if params[:user_id].present?
      @technician = User.find_by_id(params[:user_id])
    else
      @technician = User.last
    end
  end
end
