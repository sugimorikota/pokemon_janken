class NotificationsController < ApplicationController
  skip_before_action :session_present
  def index
    @notifications = current_user.notifications.order(created_at: :desc).page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
    respond_to do |format|
      format.html {
        # 通常のHTMLリクエストの場合は通常通りrenderする
        render partial: 'notifications/notifications', locals: { notifications: @notifications }
      }
      format.turbo_stream {
        # Turboフレームワークを使用する場合はturbo_streamを使用して更新する
        render turbo_stream: turbo_stream.replace('notifications', partial: 'notifications/notifications', locals: { notifications: @notifications })
      }
    end
  end

  def destroy_all
    @notifications = current_user.notifications.destroy_all
    redirect_to notifications_path
  end
end
