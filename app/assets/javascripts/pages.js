// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {

    $('body').on('click', '.enter-link', function(e) {
        var href = $(this).attr('href');
        $.ajax({
            method: "get",
            url: href,
            async: true,
            success: function(html){
                $('#nav-modal-body').html(html);
            }
        });
    });
}

$(document).on('page:load', ready);
$(document).ready(ready);