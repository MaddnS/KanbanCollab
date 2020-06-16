$(function () {
    var forms = $('.needs-validation');
    forms.find('[name]').on('focusout', function () {
        var input = $(this);
        input.removeClass('is-valid is-invalid').addClass(this.checkValidity() ? 'is-valid' : 'is-invalid');
        input.parent().find('.invalid-feedback').remove();
    });
});


$(document).ready(function () {
    $('.js-example-basic-multiple').select2();



});

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
        var taskId = $(el).data('task-id');
        var segmId = $(el).closest("ul").data('seg-id');

        $.ajax({
            method: "GET",
            url: "/changeSegment?taskId="+taskId+"&segmentId="+segmId,
            //data: {taskId,segmId},
            cache: false
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
