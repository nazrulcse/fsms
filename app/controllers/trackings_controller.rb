class TrackingsController < ApplicationController
  def index
    @technician = User.last
  end
end
