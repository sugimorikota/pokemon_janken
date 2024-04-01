import { Application } from "@hotwired/stimulus"
import { Autocomplete } from 'stimulus-autocomplete'

const application = Application.start()
application.register('autocomplete', Autocomplete)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener("turbo:load", function() {
  const autocompletePokemons = document.getElementById('autocomplete-pokemons');
  const autocompleteBoxPokemons = document.getElementById('autocomplete-box_pokemons')
  if (autocompletePokemons || autocompleteBoxPokemons) {
    // ページ固有のクラスやIDが存在する場合のみAutocompleteコントローラーを初期化
    const autocompleteController = new Autocomplete();
    autocompleteController.connect();
  }
})
