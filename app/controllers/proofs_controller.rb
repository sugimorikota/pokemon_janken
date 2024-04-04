class ProofsController < ApplicationController
    before_action :set_proof,only: %i[show]
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
