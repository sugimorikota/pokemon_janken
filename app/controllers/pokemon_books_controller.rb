# app/controllers/pokemon_books_controller.rb
class PokemonBooksController < ApplicationController
  before_action :set_pokemon_book, only: [:show, :edit, :update, :destroy]

  # GET /pokemon_books
  def index
    @pokemon_books = Pokemon.all
    @current_user = current_user
    @catch_pokemons = PokemonBook.where(user_id: current_user.id, get_flg: true).count
    @watch_pokemons = PokemonBook.where(user_id: current_user.id).count
  end

  # GET /pokemon_books/1
  def show
  end

  # GET /pokemon_books/new
  def new
    @pokemon_book = PokemonBook.new
  end

  # GET /pokemon_books/1/edit
  def edit
  end

  # POST /pokemon_books
  def create
    @pokemon_book = PokemonBook.new(pokemon_book_params)

    if @pokemon_book.save
      redirect_to @pokemon_book, notice: 'Pokemon book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pokemon_books/1
  def update
    if @pokemon_book.update(pokemon_book_params)
      redirect_to @pokemon_book, notice: 'Pokemon book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pokemon_books/1
  def destroy
    @pokemon_book.destroy
    redirect_to pokemon_books_url, notice: 'Pokemon book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_book
      @pokemon_book = PokemonBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_book_params
      params.require(:pokemon_book).permit(:user_id, :pokemon_id, :get_flg)
    end
end
