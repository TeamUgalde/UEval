// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {

    var resource = $('.show-comments-button').attr("resource");
    var id = $('.show-comments-button').attr("value");

    $('body').on('click','.send-comment-button',function () {
        var id = $(this).attr("value");
        var commentText = $("#comment-input").val();
        if(commentText != "") {
            $.ajax({
                method: "post",
                url: "/"+resource+"/"+id+"/comments",
                async: false,
                data: {'content': commentText},
                success: function(){
                    reloadComments();
                }
            });
        }
    });

    $('body').on('click','.delete-comment-button',function() {
        var commentId = $(this).attr("value");
        $.ajax({
            method: "delete",
            url: "/comments/"+commentId,
            async: false,
            success: function(){
                reloadComments();
            }
        });
    });

    $('body').on('click','.flag-comment-button',function() {
        var commentId = $(this).attr("value");
        $.ajax({
            method: "put",
            url: "/comments/"+commentId,
            async: false,
            success: function(){
                reloadComments();
            }
        });
    });

    function reloadComments() {
        $.ajax({
            method: "get",
            url: "/"+resource+"/"+id+"/comments",
            async: false,
            data: {resource: resource},
            success: function(html){
                $('#comments').html(html);
            }
        });
    }

    $('body').on('click','.show-comments-button',function() {
        var action = $(this).attr("action");
        if(action == "show") {
            var id = $(this).attr("value");
            var resource = $(this).attr("resource");
            $.ajax({
                method: "get",
                url: "/"+resource+"/"+id+"/comments",
                async: false,
                data: {resource: resource},
                success: function(html){
                    $('#comments').html(html);
                    $('#comment-section').css("display","block");
                }
            });
            $(this).attr("action", "hide");
            $(this).html('Ocultar comentarios <i class="fa fa-sort-asc"></i>');
        }else {
            $('#comment-section').css("display", "none");
            $(this).attr("action", "show");
            $(this).html('Mostrar Comentarios <i class="fa fa-comments"></i>');
        }
    });

}

$(document).on('page:load', ready);
$(document).ready(ready);


