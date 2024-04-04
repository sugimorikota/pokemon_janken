class ProfilesController < ApplicationController
  before_action :set_user,only: %i[show]
  before_action :set_current_user, only: %i[edit update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(id:@user.id),success: "ユーザーを更新しました"
    else
      flash.now[:danger] = "ユーザーを更新できませんでした"
      render :edit
    end
  end

  def show
    @user_proofs = UserProof.where(user_id: @user.id)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :salt, :name, :avatar, :avatar_cache)
  end
end
