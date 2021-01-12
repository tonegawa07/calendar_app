module CommonReservations
  extend ActiveSupport::Concern

  def create_res
    if @reservation.save
      flash[:success] = "ICP-OESの予約が完了しました．"
      redirect_to @reservation
    else
      render 'new'
    end
  end
  
end