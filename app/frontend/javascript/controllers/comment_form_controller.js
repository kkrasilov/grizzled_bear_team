// app/javascript/controllers/comment_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["form"]

    hide(event) {
        if (event.detail.success) {
            this.formTarget.classList.add("hidden")
        }
    }

    toggle() {
        this.formTarget.classList.toggle("hidden")
    }
}
