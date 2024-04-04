class Admin::UserProofsController < Admin::BaseController
  def index

  end
    
  def new
    @users = User.all
    @proofs = Proof.all
    @user_proof = UserProof.new
  end

  def create
    @user_proof = UserProof.new(user_proof_params)
    @user_proof_name = @user_proof.proof.name
    Notification.create(user_id: user_proof_params[:user_id], body: "#{@user_proof_name}をゲットした！")

    if @user_proof.save
      redirect_to admin_root_path, success: "証を配布しました"
    else
      flash.now[:danger] = "証の配布に失敗しました"
      render :new
    end
  end

  private

  def user_proof_params
    params.permit(:user_id, :proof_id)
  end
end
