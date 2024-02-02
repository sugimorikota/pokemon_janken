class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[ show edit update ]

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)#（postメソッドでUser.newからのデータが送られてきている）新規登録で作ったデータに(user_params)という引数をつけて@userに代入する  
    if @user.save#訳：@userが保存できたら
      redirect_to login_path #（ログイン出来たら「user_sessionsのnew」に飛ぶ(redirect_to)ようになる。）
      flash[:notice] = 'ユーザーの作成に成功しました'
    else#訳：@userが保存できなかったら
      flash.now[:alert] = 'ユーザーの作成に失敗しました'
      render :new #（ログイン出来なければ、usersのnewに戻る（render）） 
    end
  end

  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :salt, :name)
    end
end
