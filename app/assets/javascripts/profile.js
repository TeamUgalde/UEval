

    $('body').on('click', '.accept-button', function() {
        var resource =  $(this).attr('resource');
        var userId = $(this).attr('userId');
        var resourceId = $(this).attr('resourceId');
        $.ajax({
            method: "put",
            url: "/"+resource+"/"+resourceId,
            async: true,
            data: {state: 'accepted'},
            success: function(){
                sendNotification(resource, userId, "accepted", resourceId);
            }
        });
    });

    $('body').on('click', '.reject-button', function() {
        var resource =  $(this).attr('resource');
        var userId = $(this).attr('userId');
        var resourceId = $(this).attr('resourceId');
        sendNotification(resource, userId, "rejected", resourceId);
        $.ajax({
            method: "delete",
            url: "/"+resource+"/"+resourceId,
            async: true,
            success: function(){
            }
        });
    });

    function sendNotification(resource, userId, action, resourceId) {
        $.ajax({
            method: "post",
            url: "/notifications",
            async: true,
            data: {user_id: userId, resource: resource, state: action, resource_id: resourceId},
            success: function(){
                $(".active").trigger('click');
            }
        });
    }


    $('.nav-tabs').on('click', '.active', function() {
        var path = $(this).attr('path');
        var divId = $(this).attr('div');
        $.ajax({
            method: "get",
            url: path,
            async: true,
            success: function(html){
                if(html != "") $(divId).html(html);
                else $(divId).html(printEmptyResultMessage(divId));
            }
        });
    });

    function printEmptyResultMessage(id) {
        var res;
        if(id == "#notifications") res = "No tiene notificaciones en este momento";
        else if(id == "#pending-professors") res = "No hay profesores pendientes";
        else res = "No hay cursos pendientes";
        res = "<h4>"+res+"</h4";
        return res;
    }

    $(function(){
        var hash = window.location.hash;
        hash && $('ul.nav a[href="' + hash + '"]').tab('show');

        $('.nav-tabs a').click(function (e) {
            $(this).tab('show');
            var scrollmem = $('body').scrollTop();
            window.location.hash = this.hash;
            $('html,body').scrollTop(scrollmem);
        });
        $(".active").trigger('click');
    });





