import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]
  connect() {
  }

  toggle() {
    this.modalTarget.classList.toggle("hidden")
  }
}
