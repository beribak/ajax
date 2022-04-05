import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items", "form"]
  static values = { position: String }

  connect() {
    // console.log(this.element)
    // console.log(this.itemsTarget)
    // console.log(this.formTarget)
  }

  send(event) {
    event.preventDefault()

    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken },
      // headers: { "Accept": "application/javascript", "X-CSRF-Token": csrfToken },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML(this.positionValue, data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
