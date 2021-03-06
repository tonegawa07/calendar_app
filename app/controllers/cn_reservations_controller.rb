class CnReservationsController < ApplicationController
  include CommonReservations

  before_action :logged_in_user
  before_action :admin_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_cn_reservation, only: [:show, :edit, :update, :destroy]

  # GET /cn_reservations
  def index
    @reservations = CnReservation.all
  end

  # GET /cn_reservations/1
  def show
    @reservation = @cn_reservation
  end

  # GET /cn_reservations/new
  def new
    @reservation = CnReservation.new
  end

  # GET /cn_reservations/1/edit
  def edit
    @reservation = @cn_reservation
  end

  # POST /cn_reservations
  def create
    @reservation = CnReservation.new(cn_reservation_params)

    create_res
  end

  # PATCH/PUT /cn_reservations/1
  def update
    @reservation = @cn_reservation

    if @reservation.update(cn_reservation_params)
      flash[:success] = "CN分析機器の予約内容が変更されました．"
      redirect_to @reservation
    else
      render 'edit'
    end
  end

  # DELETE /cn_reservations/1
  def destroy
    @cn_reservation.destroy

    flash[:success] = "CN分析機器の予約が削除されました．"
    redirect_to cn_reservations_url
  end

  # GET /icp_reservations/history
  def history
    @q = CnReservation.where("end_time < ?", Time.now).order(:end_time).ransack(params[:q])
    @reservations = @q.result

    respond_to do |format|
      format.html
      format.csv do
        filename = Time.now.strftime("%Y%m%d") + "_CN分析機器_使用履歴"
        send_data render_to_string, filename: "#{filename}.csv", type: :csv
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cn_reservation
      @cn_reservation = CnReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cn_reservation_params
      params.require(:cn_reservation).permit(:lab, :name, :number_of_samples, :start_time, :end_time, :information)
    end
end
