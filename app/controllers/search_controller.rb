class SearchController < ApplicationController
  def search
    @results = search_for_pokemon  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
          turbo_stream.update("pokemons", partial: "posts/pokemons", locals: {pokemons: @results} )
      end
    end  
  end

  def suggestions
    @results = search_for_post

    respond_to do |format|
        format.turbo_stream do
            render turbo_stream:
                turbo_stream.update("suggestions", partial: "search/suggestions", locals: {results: @results} )
        end
    end
end
  private  
  def search_for_pokemon
    if params[:query].blank?
      Pokemon.all
    else
      Pokemon.search(params[:query], fields: %i[name hiragana_name], operator: "or", match: :text_middle)
    end
  end
end