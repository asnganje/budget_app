import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["overlay"]
  connect() {
    console.log("loaded");
    document.addEventListener("turbo:frame-load", (event) => {
    if (event.target.id === "modal") {
      this.modal = document.getElementById("modal")
      console.log("Modal frame ready:", this.modal)
    }
  })
  }

  toggle() {
    console.log("clicked");
    console.log(`mine is...${document.getElementById("modal")}`);
    this.overlayTarget.remove()
  }
}
