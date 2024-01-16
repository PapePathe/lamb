//
//= require highcharts/highcharts
//= require highcharts/highcharts.gray
//

jQuery(document).ready( function() {

  jQuery("a[data-toggle=modal]").on("click", function(){

    // jQuery(this).preventDefault();

     var container =  jQuery(this).attr('data-target');
     var href      =  jQuery(this).attr('href');

     jQuery(container+' .modal-body').load(href, {format: 'js', type: 'GET'});

  });

});
