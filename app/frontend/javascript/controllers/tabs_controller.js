import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["teamSection", "historySection", "teamButton", "historyButton"];

  showTeam() {
    this.teamSectionTarget.classList.remove("hidden");
    this.historySectionTarget.classList.add("hidden");

    this.teamButtonTarget.classList.add("text-teal-600", "border-b-4", "border-teal-600");
    this.historyButtonTarget.classList.remove("text-teal-600", "border-b-4", "border-teal-600");
  }

  showHistory() {
    this.historySectionTarget.classList.remove("hidden");
    this.teamSectionTarget.classList.add("hidden");

    this.historyButtonTarget.classList.add("text-teal-600", "border-b-4", "border-teal-600");
    this.teamButtonTarget.classList.remove("text-teal-600", "border-b-4", "border-teal-600");
    this.teamButtonTarget.classList.add("hover:text-teal-500");
  }
}
