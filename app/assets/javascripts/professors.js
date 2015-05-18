// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {

  var $container = $('.isotope').isotope({
    layoutMode: 'fitRows',
    itemSelector: '.element-item',
    getSortData: {
      name: '.name',
      score: '.score'
    }
  });
  
  // bind sort button click
  $('#sorts').on( 'click', 'button', function() {
    var sortByValue = $(this).attr('data-sort-by');
    $container.isotope({ sortBy: sortByValue });
  });
}

$(document).on('page:load', ready);
$(document).ready(ready);