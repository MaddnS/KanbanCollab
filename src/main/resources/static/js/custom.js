/** ----------------------------------------- csrf Token for all ajax actions------------------------------------------*/

$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

/** --------------------------------------- Drop Down Menu for Projects -----------------------------------------------*/

$(document).ready(function () {
    $('.js-example-basic-multiple').select2();
});


/** --------------------------------------- Warning message when
 viewing viewProject with mobile device --------------------------------------------------*/

$(function () {
    if ($(window).width() < 500 && window.location.pathname == '/viewProject') {
        alert('This site is not optimized for mobile devices! Please switch to desktop if possible.');
    }
});

/** ---------------------------------------------- DragAndDrop -----------------------------------------------------*/
/** Custom Dragula JS */

dragula([
    document.getElementById("to-do"),
    document.getElementById("in-progress"),
    document.getElementById("done")
], {
    removeOnSpill: false,
})
    .on("drag", function (el) {
        el.className.replace("ex-moved", "");
    })
    /** -------------------------------------------- Change segment on Drop ----------------------------------------------*/

    .on("drop", function (el) {
        var taskId = $(el).data('task-id');
        var segmId = $(el).closest("ul").data('seg-id');
        var token = $("meta[name='_csrf']").attr("content");


        $.ajax({
            type: "POST",
            url: "/changeSegment",
            data: {
                taskId: taskId,
                segmentId: segmId,
                CSRF: token
            }
        })
            .done(function (html) {
            });

        el.className += "ex-moved";
    })
    .on("over", function (el, container) {
        container.className += "ex-over";
    })
    .on("out", function (el, container) {
        container.className.replace("ex-over", "");
    });

/** ---------------------------------------------- Create Tasks ----------------------------------------------------- */

$("#inputTaskForm").submit(function (e) {

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
            CSRF: ctok
        },
        cache: false
    })
        .done(function (html) {
            window.location.reload();
        });

});

$(document).on("click", ".open-changeTask", function () {
    var taId = $(this).closest('li').data('task-id');


    /** ----------------------------------------------- Change Task ----------------------------------------------------- */

    $("#changeTaskForm").submit(function (ele) {

        ele.preventDefault(); //prevent default action


        var taskFId = taId;
        var taskFDesc = document.getElementById("ctask_description").value;
        var taskFName = document.getElementById("ctask_name").value;
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
            .done(function (html) {
                window.location.reload();
            });

    });

});


/** ------------------------------------------ Delete Task --------------------------------------------- */

$(".delete-Task-Form").submit(function (e) {

    e.preventDefault(); //prevent default action
    var taskID = $(this).closest('li').data('task-id');
    var ctok = $("meta[name='_csrf']").attr("content");

    $.ajax({
        type: "POST",
        url: "/deleteTask",
        data: {
            taskId: taskID,
            CSRF: ctok
        },
        cache: false
    })
        .done(function (html) {
            window.location.reload();
        });

});


/** ----------------------------------------- MAIL ------------------------------------------------- */

$(document).on("click", "#invite_email_address", function () {

    var email = document.getElementById("invite_email_address").value
    console.log(email);
    $.ajax({
        method: "GET",
        url: "/inviteUser?email" + email,
        cache: false
    })

        .done(function () {
            alert('email is nice')
        })
});




