import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    flashes: String,
  };

  connect() {
    window.addEventListener("turbo:load", (event) => {
      if (this.flashesValue !== "") {
        this.init();
      }
    });

    window.addEventListener("turbo:before-stream-render", (event) => {
      const fallbackToDefaultActions = event.detail.render;
      event.detail.render = (streamElement) => {
        if (streamElement.target == "flashes") {
          const parser = new DOMParser();
          const template = streamElement.querySelector("template").innerHTML;
          const element = parser.parseFromString(template, "text/html");
          this.flashesValue =
            element.querySelector("hr").dataset.sweetalertFlashesValue;
          this.init();
        } else {
          fallbackToDefaultActions(streamElement);
        }
      };

      if (this.flashesValue) {
        this.init();
      }
    });
  }

  init() {
    const options = this.setOptions();
    this.fire(options);
  }

  setOptions() {
    const flash = this.flashesValue.split(":");
    const icon = this.setIcon(flash[0]);
    return {
      title: "Voili voilou !",
      text: flash[1],
      icon: icon,
      confirmButtonText: "Cool",
    };
  }

  setIcon(type) {
    switch (type) {
      case "alert":
        return "warning";
      case "notice":
        return "info";
      case "voted":
        return "success";
      case "unvoted":
        return "success";
      default:
        return "info";
    }
  }

  fire(options) {
    window.Swal.fire(options).then((result) => {
      if (result) {
        this.flashesValue = "";
      }
    });
  }
}
