(function () {
  "use strict";
  document.documentElement.classList.add("js");

  // Mobile menu
  var toggle = document.querySelector(".nav-toggle");
  var nav = document.getElementById("site-nav");
  if (toggle && nav) {
    toggle.addEventListener("click", function () {
      var open = nav.classList.toggle("open");
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
    });
    nav.addEventListener("click", function (e) {
      if (e.target.tagName === "A") {
        nav.classList.remove("open");
        toggle.setAttribute("aria-expanded", "false");
      }
    });
  }

  // Download buttons: the real link lives in the HTML (see README). If it was never filled in, say so instead of
  // sending visitors to a dead link.
  var buttons = document.querySelectorAll("[data-download]");
  for (var i = 0; i < buttons.length; i++) {
    var b = buttons[i];
    var href = b.getAttribute("href") || "";
    if (href.indexOf("DOWNLOAD_URL_PLACEHOLDER") !== -1) {
      b.setAttribute("href", "#get");
      b.setAttribute("aria-disabled", "true");
      b.textContent = "Download link coming soon";
    }
  }

  // Footer year
  var y = document.getElementById("year");
  if (y) y.textContent = String(new Date().getFullYear());
})();
