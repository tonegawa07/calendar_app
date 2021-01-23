class ApplicationController < ActionController::Base
  include SessionsHelper

  private
   # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end

    # 管理者かどうか確認
    def admin_user
      # 管理者でない場合，現在のページに戻される
      redirect_to(request.referer) unless current_user.admin?
    end
end
