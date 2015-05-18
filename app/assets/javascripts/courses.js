// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {
    var $containerCourses = $('.isotope-courses').isotope({
        layoutMode: 'fitRows',
        itemSelector: '.element-item',
        getSortData: {
            name: '.name'
        }
    });

    // bind sort button click
    $('body').on( 'click', '.button-courses', function() {
        var sortByValue = $(this).attr('data-sort-by');
        $containerCourses.isotope({ sortBy: sortByValue });
    });
}

$(document).on('page:load', ready);
$(document).ready(ready);