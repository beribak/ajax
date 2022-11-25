import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
  }
  
  send(event) {
    console.log(this.formTarget.action)
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: {"Accept": "text/plain"}, // with JSON - headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)
    })
    .then(response => response.text()) // with JSON - .then(response => response.text())
    .then((data) => {
      
      // with text
      console.log(data)
      this.itemsTarget.insertAdjacentHTML('beforeend', data)
      this.formTarget.reset()

      //with JSON
      
      // if (data.inserted_item) {
      //   this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
      // }
      // this.formTarget.outerHTML = data.form
    })
  }
}
