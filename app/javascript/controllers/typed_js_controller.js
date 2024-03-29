import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["CIDER?", "SPIT CIDER", `SPIT CIDER <i class=" fa-solid fa-droplet"></i>`,],
      typeSpeed: 80,
      loop: false
    });
  }
}
