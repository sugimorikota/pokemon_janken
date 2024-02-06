class BoxPokemonsController < ApplicationController
  skip_before_action :check_current_user_box_pokemons, only: %i[select]
  before_action :box_pokemons, only: %i[index change]
  before_action :main_pokemon

  def select
    if @main_pokemon.present?
      @main_pokemon.update(main_flg: false)
    end
    pokemon_id = params[:pokemon_id]
    @select_pokemon = BoxPokemon.new(user_id: current_user.id, pokemon_id: pokemon_id, main_flg: true)
    if @select_pokemon.save
      redirect_to root_path
      flash[:notice] = 'ユーザーの作成に成功しました'
    else
      flash.now[:alert] = 'ユーザーの作成に失敗しました'
      render :pokemons_path
    end
  end

  def index
    @q = Pokemon.joins(:box_pokemons).where(box_pokemons: { user_id: current_user.id }).ransack(params[:q])
    @box_pokemons = @q.result.order(id: :asc)
  end

  def change
    if @main_pokemon.present?
      @main_pokemon.update(main_flg: false)
    end
    pokemon_id = params[:pokemon_id]
    @new_main_pokemon = @box_pokemons.find_by(pokemon_id: pokemon_id)
    @new_main_pokemon.update(main_flg: true)
    redirect_to root_path
  end

  def search
    @search_box_pokemons = Pokemon.joins(:box_pokemons).where(box_pokemons: { user_id: current_user.id }).ransack(params[:q]).result.where("name like ?", "%#{params[:q]}%")
    #@search_box_pokemons = Pokemon.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private
  def box_pokemons
    @box_pokemons = BoxPokemon.where(user_id: current_user.id).order(:pokemon_id)
  end

  def main_pokemon
    @main_pokemon = BoxPokemon.find_by(user_id: current_user.id, main_flg: true)
  end
end
