class LocationsController < ApplicationController
  def update
    current_user.update!(
      latitude: params[:latitude],
      longitude: params[:longitude]
    )
    head :ok
  end
end
