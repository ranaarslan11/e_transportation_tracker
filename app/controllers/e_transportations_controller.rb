class ETransportationsController < ApplicationController
  def create
    e_transport = ETransportation.new(e_transportation_params)
    if e_transport.save
      render json: e_transport, status: :created
    else
      render json: { errors: e_transport.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    data = ETransportation.group(:transportation_type, :sensor_type, :in_zone).count
    render json: data
  end

  private

  def e_transportation_params
    params.require(:e_transportation).permit(:transportation_type, :sensor_type, :owner_id, :in_zone, :lost_sensor)
  end
end