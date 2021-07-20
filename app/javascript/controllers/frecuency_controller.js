import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static values = { id: String }

  show() {
    let person_element = document.getElementById(`${this.idValue}`)

    if (person_element.classList.contains('hidden')) {
      document.getElementById(`${this.idValue}`).classList.remove('hidden')
      this.element.innerHTML = 'Close'
    } else {
      document.getElementById(`${this.idValue}`).classList.add('hidden')
      this.element.innerHTML = 'Show Frecuency'
    }
  }
}
