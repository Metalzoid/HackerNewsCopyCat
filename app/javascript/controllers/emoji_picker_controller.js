import { Controller } from "@hotwired/stimulus";
import data from "@emoji-mart/data";
import { Picker } from "emoji-mart";

// Connects to data-controller="emoji-picker"
export default class extends Controller {
  connect() {}

  openPicker(event) {
    const target = event.target.parentElement.querySelector(
      ".picker-placeholder"
    );
    target.innerHTML = "";
    new Picker({
      parent: target,
      data: data,
      onEmojiSelect: (emoji) => {
        this.emojiSelected(emoji, event);
      },
      onClickOutside: (event) => {
        if (!event.params) {
          target.innerHTML = "";
        }
      },
    });
  }

  emojiSelected(emoji, event) {
    const form = event.target.parentElement.parentElement.querySelector("form");
    const input = form.querySelector("#reaction_content");
    input.value = emoji.native;
    form.submit();
  }
}
