class UserPokemonMatch < ApplicationRecord
  belongs_to :user

  def type(pokemon1, pokemon2)
    totalpoint = 0
    pokemon1.each do |p1|
      pokemon2.each do |p2|
        case p1.pokemon_type_id
        when 1 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 2
          when 4
            point = 2
          when 5
            point = 2
          when 6
            point = 1
          when 7
            point = 2
          when 8
            point = 0
          when 9
            point = 1
          when 10
            point = 2
          when 11
            point = 2
          when 12
            point = 2
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 2
          when 17
            point = 2
          when 18
            point = 2
          end
        when 2 then
          case p2.pokemon_type_id
          when 1
            point = 3
          when 2
            point = 2
          when 3
            point = 1
          when 4
            point = 1
          when 5
            point = 2
          when 6
            point = 3
          when 7
            point = 1
          when 8
            point = 0
          when 9
            point = 3
          when 10
            point = 2
          when 11
            point = 2
          when 12
            point = 2
          when 13
            point = 2
          when 14
            point = 1
          when 15
            point = 3
          when 16
            point = 2
          when 17
            point = 3
          when 18
            point = 1
          end
        when 3 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 3
          when 3
            point = 2
          when 4
            point = 2
          when 5
            point = 2
          when 6
            point = 1
          when 7
            point = 3
          when 8
            point = 2
          when 9
            point = 1
          when 10
            point = 2
          when 11
            point = 2
          when 12
            point = 3
          when 13
            point = 1
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 2
          when 17
            point = 2
          when 18
            point = 2
          end
        when 4 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 2
          when 4
            point = 1
          when 5
            point = 1
          when 6
            point = 1
          when 7
            point = 2
          when 8
            point = 1
          when 9
            point = 0
          when 10
            point = 2
          when 11
            point = 2
          when 12
            point = 3
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 2
          when 17
            point = 2
          when 18
            point = 3
          end
        when 5 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 0
          when 4
            point = 3
          when 5
            point = 2
          when 6
            point = 3
          when 7
            point = 1
          when 8
            point = 2
          when 9
            point = 3
          when 10
            point = 3
          when 11
            point = 2
          when 12
            point = 1
          when 13
            point = 3
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 2
          when 17
            point = 2
          when 18
            point = 2
          end
        when 6 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 1
          when 3
            point = 3
          when 4
            point = 2
          when 5
            point = 1
          when 6
            point = 2
          when 7
            point = 3
          when 8
            point = 2
          when 9
            point = 1
          when 10
            point = 3
          when 11
            point = 2
          when 12
            point = 2
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 3
          when 16
            point = 2
          when 17
            point = 2
          when 18
            point = 2
          end
        when 7 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 1
          when 3
            point = 1
          when 4
            point = 1
          when 5
            point = 2
          when 6
            point = 2
          when 7
            point = 2
          when 8
            point = 1
          when 9
            point = 1
          when 10
            point = 1
          when 11
            point = 2
          when 12
            point = 3
          when 13
            point = 2
          when 14
            point = 3
          when 15
            point = 2
          when 16
            point = 2
          when 17
            point = 3
          when 18
            point = 1
          end
        when 8 then
          case p2.pokemon_type_id
          when 1
            point = 0
          when 2
            point = 2
          when 3
            point = 2
          when 4
            point = 2
          when 5
            point = 2
          when 6
            point = 2
          when 7
            point = 2
          when 8
            point = 3
          when 9
            point = 2
          when 10
            point = 2
          when 11
            point = 2
          when 12
            point = 2
          when 13
            point = 2
          when 14
            point = 3
          when 15
            point = 2
          when 16
            point = 2
          when 17
            point = 1
          when 18
            point = 2
          end
        when 9 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 2
          when 4
            point = 2
          when 5
            point = 2
          when 6
            point = 3
          when 7
            point = 2
          when 8
            point = 2
          when 9
            point = 1
          when 10
            point = 1
          when 11
            point = 1
          when 12
            point = 2
          when 13
            point = 1
          when 14
            point = 2
          when 15
            point = 3
          when 16
            point = 2
          when 17
            point = 2
          when 18
            point = 3
          end
        when 10 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 2
          when 4
            point = 2
          when 5
            point = 2
          when 6
            point = 1
          when 7
            point = 3
          when 8
            point = 2
          when 9
            point = 3
          when 10
            point = 1
          when 11
            point = 1
          when 12
            point = 3
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 3
          when 16
            point = 1
          when 17
            point = 2
          when 18
            point = 2
          end
        when 11 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 2
          when 4
            point = 2
          when 5
            point = 3
          when 6
            point = 3
          when 7
            point = 2
          when 8
            point = 2
          when 9
            point = 2
          when 10
            point = 3
          when 11
            point = 1
          when 12
            point = 1
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 1
          when 17
            point = 2
          when 18
            point = 2
          end
        when 12 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 1
          when 4
            point = 1
          when 5
            point = 3
          when 6
            point = 3
          when 7
            point = 1
          when 8
            point = 2
          when 9
            point = 1
          when 10
            point = 1
          when 11
            point = 3
          when 12
            point = 1
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 1
          when 17
            point = 2
          when 18
            point = 2
          end
        when 13 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 3
          when 4
            point = 2
          when 5
            point = 0
          when 6
            point = 2
          when 7
            point = 2
          when 8
            point = 2
          when 9
            point = 2
          when 10
            point = 2
          when 11
            point = 3
          when 12
            point = 1
          when 13
            point = 1
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 1
          when 17
            point = 2
          when 18
            point = 2
          end
        when 14 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 3
          when 3
            point = 2
          when 4
            point = 3
          when 5
            point = 2
          when 6
            point = 2
          when 7
            point = 2
          when 8
            point = 2
          when 9
            point = 1
          when 10
            point = 2
          when 11
            point = 2
          when 12
            point = 2
          when 13
            point = 2
          when 14
            point = 1
          when 15
            point = 2
          when 16
            point = 2
          when 17
            point = 0
          when 18
            point = 2
          end
        when 15 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 3
          when 4
            point = 2
          when 5
            point = 3
          when 6
            point = 2
          when 7
            point = 2
          when 8
            point = 2
          when 9
            point = 1
          when 10
            point = 1
          when 11
            point = 1
          when 12
            point = 3
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 1
          when 16
            point = 3
          when 17
            point = 2
          when 18
            point = 2
          end
        when 16 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 2
          when 3
            point = 2
          when 4
            point = 2
          when 5
            point = 2
          when 6
            point = 2
          when 7
            point = 2
          when 8
            point = 2
          when 9
            point = 1
          when 10
            point = 2
          when 11
            point = 2
          when 12
            point = 2
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 3
          when 17
            point = 2
          when 18
            point = 0
          end
        when 17 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 1
          when 3
            point = 2
          when 4
            point = 2
          when 5
            point = 2
          when 6
            point = 2
          when 7
            point = 2
          when 8
            point = 3
          when 9
            point = 2
          when 10
            point = 2
          when 11
            point = 2
          when 12
            point = 2
          when 13
            point = 2
          when 14
            point = 3
          when 15
            point = 2
          when 16
            point = 2
          when 17
            point = 1
          when 18
            point = 1
          end
        when 18 then
          case p2.pokemon_type_id
          when 1
            point = 2
          when 2
            point = 3
          when 3
            point = 2
          when 4
            point = 1
          when 5
            point = 2
          when 6
            point = 2
          when 7
            point = 2
          when 8
            point = 2
          when 9
            point = 1
          when 10
            point = 1
          when 11
            point = 2
          when 12
            point = 2
          when 13
            point = 2
          when 14
            point = 2
          when 15
            point = 2
          when 16
            point = 3
          when 17
            point = 3
          when 18
            point = 2
          end
        end
        totalpoint += point
      end
    end
    totalpoint
  end
end
