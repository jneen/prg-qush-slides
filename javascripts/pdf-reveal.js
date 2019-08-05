PDFReveal = (function(window) {
  var pdfStylesheet;
  var document = window.document

  function init() {
    pdfStylesheet = document.getElementById('pdf-stylesheet');
  }

  function keydown(evt) {
    if (!(evt.key === ',' && evt.ctrlKey)) return;
    if (!pdfStylesheet) return;

    pdfStylesheet.attr('media', 'all');
  }

  init();
  window.document.addEventListener('keydown', keydown)

  return {}
})(window);
