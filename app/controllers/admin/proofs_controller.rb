class Admin::ProofsController < Admin::BaseController
  before_action :set_proof,only: %i[show edit update]

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

  def edit
    
  end

  def update
    if @proof.update(proof_params)
      redirect_to admin_proof_path
    else
      render :edit
    end
  end

  private

  def set_proof
    @proof = Proof.find(params[:id])
  end

  def proof_params
    params.require(:proof).permit(:name, :body, :proof_image, :proof_image_cache)
  end
end
