class UserPokemonMatchesController < ApplicationController
  
  before_action :current_user_mainpokemon, only: %i[ standby battle result ]
  before_action :current_user_pokemon_match, only: %i[ standby battle result ]
  before_action :match_limit, only: %i[ battle result]
  before_action :session_empty, only: %i[ result ]
  skip_before_action :session_present, only: %i[ battle result ]

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
    add_pokemonbooks(session[:match_pokemon_pokemon_id]) if @match_pokemon.present?
  end

  def result
    match_pokemon_pokemon_id = session[:match_pokemon_pokemon_id]
    @mytype = IndividualPokemonType.where(pokemon_id: @main_pokemon.pokemon_id)
    @matchtype = IndividualPokemonType.where(pokemon_id: match_pokemon_pokemon_id)
    attackpoint = @current_user_pokemon_match.type(@mytype, @matchtype)
    deffencepoint = @current_user_pokemon_match.type(@matchtype, @mytype)
    session.delete(:match_pokemon_id)
    session.delete(:match_pokemon_pokemon_id)
    @current_user_pokemon_match.match_limit -= 1
    @current_user_pokemon_match.save
    
    if attackpoint > deffencepoint
      @result_message = "WIN"
      @current_user_pokemon_match.match_score += 10
      @current_user_pokemon_match.save
      add_box_pokemons(match_pokemon_pokemon_id)
      get_pokemonbooks(match_pokemon_pokemon_id)
    elsif attackpoint == deffencepoint
      @result_message = "DROW"
      @current_user_pokemon_match.match_score += 3
      @current_user_pokemon_match.save
      # 50%でポケモンゲット！！
      if rand(1..100) <= 50
        add_box_pokemons(match_pokemon_pokemon_id)
        get_pokemonbooks(match_pokemon_pokemon_id)
      end
    else
      @current_user_pokemon_match.match_score -= 5
      @current_user_pokemon_match.save
      @result_message = "LOSE"
    end
  end

  private
  def current_user_mainpokemon
    @main_pokemon = BoxPokemon.find_by(user_id: current_user.id, main_flg: true)
  end

  def current_user_pokemon_match
    @current_user_pokemon_match = UserPokemonMatch.find_by(user_id: current_user.id)
  end

  def session_empty
    unless session[:match_pokemon_id].present?
      redirect_to user_pokemon_matches_standby_path
    end
  end

  def add_pokemonbooks(pokemon_id)
    pokemonbook_present = PokemonBook.find_by(user_id: current_user, pokemon_id: pokemon_id)
    unless pokemonbook_present.present?
      PokemonBook.create(
        user_id: current_user.id,
        pokemon_id: pokemon_id
      )
    end
  end

  def get_pokemonbooks(pokemon_id)
    pokemonbook_present = PokemonBook.find_by(user_id: current_user, pokemon_id: pokemon_id)
    if pokemonbook_present.present?
      PokemonBook.update(
        get_flg: true
      )
    end
  end

  def add_box_pokemons(pokemon_id)
    mybox_present = BoxPokemon.find_by(user_id: current_user.id, pokemon_id: pokemon_id)
    unless mybox_present.present?
      @pokemonget = BoxPokemon.create(
        user_id: current_user.id,
        pokemon_id: pokemon_id
      )
    end
  end

  def match_limit
    if @current_user_pokemon_match.match_limit <= 0
      redirect_to user_pokemon_matches_standby_path, danger: "本日の対戦回数制限をむかえました"
    end
  end
end
