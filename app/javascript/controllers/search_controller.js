import { Controller } from "@hotwired/stimulus";

export default class SearchController extends Controller {
  static targets = ["input", "category"];

  connect() {}

  search(event) {
    event.preventDefault();
    this.inputTarget.innerText = this.categoryTarget.innerText
    document.getElementById("dropdown").classList.add("hidden")
  }
}
