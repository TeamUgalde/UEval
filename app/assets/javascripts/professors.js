// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {
    var $containerProfessors = $('.isotope-professors').isotope({
        layoutMode: 'fitRows',
        itemSelector: '.element-item',
        getSortData: {
            name: '.name'
        }
    });

    // bind sort button click
    $('body').on( 'click', '.button-professors', function() {
        var sortByValue = $(this).attr('data-sort-by');
        $containerProfessors.isotope({ sortBy: sortByValue });
    });

}

$(document).on('page:load', ready);
$(document).ready(ready);