class Admin::ProofsController < Admin::BaseController
  before_action :set_proof,only: %i[show]

  def index
    @proofs = Proof.all
  end

  def new
    @proof = Proof.new
  end

  def create
    @proof = Proof.new(proof_params)
    if @proof.save
      flash[:success] = '証を作成しました'
      redirect_to admin_proofs_path
    else
      render :new
    end
  end

  def show
    
  end


  private

  def set_proof
    @proof = Proof.find(params[:id])
  end

  def proof_params
    params.require(:proof).permit(:name, :body, :proof_image, :proof_image_cache)
  end
end
