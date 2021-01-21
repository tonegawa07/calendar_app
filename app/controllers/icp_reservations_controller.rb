class IcpReservationsController < ApplicationController
  include CommonReservations

  before_action :logged_in_user
  before_action :set_icp_reservation, only: [:show, :edit, :update, :destroy]

  # GET /icp_reservations
  def index
    @reservations = IcpReservation.all
  end

  # GET /icp_reservations/1
  def show
    @reservation = @icp_reservation
  end

  # GET /icp_reservations/new
  def new
    @reservation = IcpReservation.new
  end

  # GET /icp_reservations/1/edit
  def edit
    @reservation = @icp_reservation
  end

  # POST /icp_reservations
  def create
    @reservation = IcpReservation.new(icp_reservation_params)
    
    create_res
  end

  # PATCH/PUT /icp_reservations/1
  def update
    @reservation = @icp_reservation

    if @reservation.update(icp_reservation_params)
      flash[:success] = "ICP-OESの予約内容が変更されました．"
      redirect_to @reservation
    else
      render 'edit'
    end
  end

  # DELETE /icp_reservations/1
  def destroy
    @icp_reservation.destroy

    flash[:success] = "ICP-OESの予約が削除されました．"
    redirect_to icp_reservations_url
  end

  # GET /icp_reservations/history
  def history
    @reservations = IcpReservation.where("end_time < ?", Time.now).order(:end_time)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icp_reservation
      @icp_reservation = IcpReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icp_reservation_params
      params.require(:icp_reservation).permit(:lab, :name, :number_of_samples, :start_time, :end_time, :information)
    end
end
