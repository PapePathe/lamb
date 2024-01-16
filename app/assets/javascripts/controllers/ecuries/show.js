/*
 * = require jquery.jcaroussel/jquery.jcaroussel
 * = require jquery.tablesorter/jquery.tablesorter
 *
 */

jQuery(document).ready
  (
    function () {
      jQuery('#featured-lutteurs').jcarousel
        (
          {
            visible: 3,
            scroll: 1
          }
        );

      jQuery("table").tablesorter();
    }
  );
