import { Controller } from "@hotwired/stimulus";

export default class SearchCountriesController extends Controller {
  static targets = ["input", "category"];

  connect() {}

  regionSearch(event) {
    event.preventDefault();
    this.inputTarget.value = this.categoryTarget.textContent.trim()
    document.getElementById("dropdown").classList.add("hidden")

    if (window.location.pathname !== "/") {
      window.location.href = "/";
    }
  }

  inputSearch(){
    if (window.location.pathname !== "/") {
      window.location.href = "/";
    }
  }
}
