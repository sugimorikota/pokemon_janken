class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :check_current_user_box_pokemons, only: %i[new create]
  before_action :set_user, only: %i[ edit update ]

  def index
    @users = User.joins(:user_pokemon_match).order('user_pokemon_matches.match_score DESC')
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      UserPokemonMatch.create(user_id: @user.id)
      
      redirect_to login_path
      flash[:success] = 'ユーザーの作成に成功しました'
    else
      flash[:danger] = 'ユーザーの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :salt, :name, :avatar, :avatar_cache)
    end
end
