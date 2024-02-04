class UserPokemonMatchesController < ApplicationController
  before_action :current_user_mainpokemon, only: %i[ standby battle result ]
  before_action :current_user_pokemon_match, only: %i[ standby battle result ]

  def standby
    @current_user_pokemon_match = UserPokemonMatch.find_by(user_id: current_user.id)
  end

  def battle
    if session[:match_pokemon_id].present?
      @match_pokemon = BoxPokemon.find_by(id: session[:match_pokemon_id])
    else
      @match_pokemon = BoxPokemon.where.not(user_id: current_user.id).order(Arel.sql('RANDOM()')).first
      session[:match_pokemon_id] = @match_pokemon.id if @match_pokemon
      session[:match_pokemon_pokemon_id] = @match_pokemon.pokemon_id if @match_pokemon
    end
    #byebug
  end

  def result
    match_pokemon_pokemon_id = session[:match_pokemon_pokemon_id]
    @mytype = IndividualPokemonType.where(pokemon_id: @main_pokemon.pokemon_id)
    @matchtype = IndividualPokemonType.where(pokemon_id: match_pokemon_pokemon_id)
    attackpoint = @current_user_pokemon_match.type(@mytype, @matchtype)
    deffencepoint = @current_user_pokemon_match.type(@matchtype, @mytype)
    mybox_present = BoxPokemon.find_by(user_id: current_user.id, pokemon_id: match_pokemon_pokemon_id)
    session.delete(:match_pokemon_id)
    session.delete(:match_pokemon_pokemon_id)
    @current_user_pokemon_match.match_limit -= 1
    @current_user_pokemon_match.save
    
    if attackpoint > deffencepoint
      @result_message = "かち"
      @current_user_pokemon_match.match_score += 10
      @current_user_pokemon_match.save
      unless mybox_present.present?
        @pokemonget = BoxPokemon.create(
          user_id: current_user.id,
          pokemon_id: match_pokemon_pokemon_id
        )
      end
    elsif attackpoint == deffencepoint
      @result_message = "引き分け"
      @current_user_pokemon_match.match_score += 3
      @current_user_pokemon_match.save
    else
      @current_user_pokemon_match.match_score -= 5
      @current_user_pokemon_match.save
      @result_message = "負け"
    end
  end

  private
  def current_user_mainpokemon
    @main_pokemon = BoxPokemon.find_by(user_id: current_user.id, main_flg: true)
  end

  def current_user_pokemon_match
    @current_user_pokemon_match = UserPokemonMatch.find_by(user_id: current_user.id)
  end
end
