window.MathJax = {
  tex: {
    inlineMath: [["\\(", "\\)"]],
    displayMath: [["\\[", "\\]"]],
    processEscapes: true,
    processEnvironments: true
  },
  options: {
    ignoreHtmlClass: ".*|",
    processHtmlClass: "arithmatex"
  },
  startup: {
    ready() {
      MathJax.startup.defaultReady();
      MathJax.startup.promise.then(() => {
        // Signal explicite à mkdocs-exporter que le rendu est fini
        document.dispatchEvent(new Event("DOMContentLoaded"));
      });
    }
  }
};

document$.subscribe(() => {
  MathJax.typesetPromise();
});
