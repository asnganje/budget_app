import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["hamburger", "close", "dropdown"]
  connect() {
  }
  toggle(){       
    this.hamburgerTarget.classList.toggle("hidden")
    this.closeTarget.classList.toggle("hidden")
    this.dropdownTarget.classList.toggle("hidden")
  }
}
