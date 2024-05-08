import { Controller } from "@hotwired/stimulus";

export default class SearchController extends Controller {
  static targets = ["input", "country"];

  connect() {}

  search(event) {
    event.preventDefault();
    const query = this.inputTarget.value.toLowerCase();
    this.countryTargets.forEach((country) => {
      const name = country.dataset.name.toLowerCase();
      if (name.includes(query)) {
        country.classList.remove("hidden");
      } else {
        country.classList.add("hidden");
      }
    });
  }
}
