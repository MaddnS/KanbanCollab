$(function () {
    var forms = $('.needs-validation');
    forms.find('[name]').on('focusout', function () {
        var input = $(this);
        input.removeClass('is-valid is-invalid').addClass(this.checkValidity() ? 'is-valid' : 'is-invalid');
        input.parent().find('.invalid-feedback').remove();
    });
});

$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


$(document).ready(function () {
    $('.js-example-basic-multiple').select2();
});


// ---------------------------------------------- DragAndDrop -----------------------------------------------------
/* Custom Dragula JS */
dragula([
    document.getElementById("to-do"),
    document.getElementById("in-progress"),
    document.getElementById("done")
], {
    removeOnSpill: false,
    //revertOnSpill:true
})
    .on("drag", function(el) {
        el.className.replace("ex-moved", "");
    })

    .on("drop", function(el) {
        var taskId = $(el).data('task-id');//document.getElementById("postSegmTaskId")//
        var segmId = $(el).closest("ul").data('seg-id');
        var token = $("meta[name='_csrf']").attr("content");

        console.log(token)
        $.ajax({
            type: "POST",
            url: "/changeSegment",
            data: {
                taskId: taskId,
                segmentId: segmId,
                "_csrf": token
            }
            //cache: false
        })
            .done(function( html ) {
                alert('Task ' + taskId + ' in Segment '+ segmId + ' verschoben');
            });

        el.className += "ex-moved";

    })

    .on("over", function(el, container) {
        container.className += "ex-over";
    })
    .on("out", function(el, container) {
        container.className.replace("ex-over", "");
    });



// ---------------------------------------------- Tasks -----------------------------------------------------

$("#inputTaskForm").submit(function(e) {

    e.preventDefault(); //prevent default action
    var taskFDesc = document.getElementById("task_description").value
    var taskFName = document.getElementById("task_name").value
    var taskFProj = document.getElementById("task_project").value
    var ctok = $("meta[name='_csrf']").attr("content");

    $.ajax({
        type: "POST",
        url: "/createTask",
        data: {
            tname: taskFName,
            tdesc: taskFDesc,
            tproj: taskFProj,
            CSRF:ctok
        },
        cache: false
    })
        .done(function( html ) {
            //alert('neuer task funzt');
            window.location.reload();
        });

});


$(document).on("click", ".open-changeTask", function (e) {
    const taId = $(e).data('t-Id');
    console.log(taId + 'sheesh')
    //$(".modal-body #bookId").val( tId );

});

$("#changeTaskForm").submit(function(ele) {

    ele.preventDefault(); //prevent default action


    var taskFId = 5
    var taskFDesc = document.getElementById("ctask_description").value
    var taskFName = document.getElementById("ctask_name").value
    //var taskFProj = document.getElementById("ctask_project").value
    var token = $("meta[name='_csrf']").attr("content");

    $.ajax({
        type: "POST",
        url: "/changeTask",
        data: {
            tId: taskFId,
            tname: taskFName,
            tdesc: taskFDesc,
            CSRF: token
        },
        cache: false
    })
        .done(function( html ) {
            alert('change task funzt');
            window.location.reload();
        });

});

