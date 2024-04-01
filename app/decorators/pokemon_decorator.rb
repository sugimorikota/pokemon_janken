class PokemonDecorator < Draper::Decorator
  delegate_all

  def render_name_link
    if user_has_pokemon?
      h.link_to object.name, "#", onclick: "window.open('https://zukan.pokemon.co.jp/detail/#{object.no}', 'ポケモン詳細', 'width=600, height=550')", class:'link'
    else
      "?"
    end
  end

  def render_image_tag
    if user_has_pokemon?
      h.image_tag(object.pokemon_image)
    else
      h.image_tag("poke-ball.png", alt: "poke-ball")
    end
  end

  def render_type_images
    if user_has_pokemon?
      object.pokemon_types.map { |type| h.image_tag(type.type_image, height: '25', weight: '75', style: 'padding-right: 3px;') }.join.html_safe
    else
      object.pokemon_types.map { |type| h.image_tag('pokemonbooks_type.png', height: '25', weight: '75', style: 'padding-right: 3px;') }.join.html_safe
    end
    
  end

  def row_background_color
    if PokemonBook.find_by(user_id: h.current_user.id, pokemon_id: object.id, get_flg: true).present?
      "#FFFFEE"
    else
      "grey"
    end
  end

  private

  def user_has_pokemon?
    PokemonBook.find_by(user_id: h.current_user.id, pokemon_id: object.id).present?
  end

end
