$(document).ready(function () {
    $('.js-example-basic-multiple').select2();



});
/*
function showResponse(responseText, statusText, xhr, $form)  {
    // for normal html responses, the first argument to the success callback
    // is the XMLHttpRequest object's responseText property

    // if the ajaxSubmit method was passed an Options Object with the dataType
    // property set to 'xml' then the first argument to the success callback
    // is the XMLHttpRequest object's responseXML property

    // if the ajaxSubmit method was passed an Options Object with the dataType
    // property set to 'json' then the first argument to the success callback
    // is the json data object returned by the server

    alert('status: ' + statusText + '\n\nresponseText: \n' + responseText +
        '\n\nWorked.');
}
*/


/* Custom Dragula JS */

dragula([
    document.getElementById("to-do"),
    document.getElementById("in-progress"),
    document.getElementById("done")

], {
    removeOnSpill: false,
    //revertOnSpill:true
})

    .on("drag", function (el) {
        el.className.replace("ex-moved", "");
    })
    .on("drop", function (el) {
        /*el.className += "ex-moved";
        var options = {
            target: '#taskSegment',   // target element(s) to be updated with server response
            //beforeSubmit: showRequest,  // pre-submit callback
            success: showResponse  // post-submit callback

            // other available options:
            //url:       url         // override for form's 'action' attribute
            //type:      type        // 'get' or 'post', override for form's 'method' attribute
            //dataType:  null        // 'xml', 'script', or 'json' (expected server response type)
            //clearForm: true        // clear all form fields after successful submit
            //resetForm: true        // reset the form after successful submit

            // $.ajax options can be used here too, for example:
            //timeout:   3000
        };

        // bind to the form's submit event
        $('#task').submit(function () {
            // inside event callbacks 'this' is the DOM element so we first
            // wrap it in a jQuery object and then invoke ajaxSubmit
            $(this).ajaxSubmit(options);

            // !!! Important !!!
            // always return false to prevent standard browser submit and page navigation
            return false;
        });*/

    })
    .on("over", function (el, container) {
        container.className += "ex-over";
    })
    .on("out", function (el, container) {
        container.className.replace("ex-over", "");
    });


/*// wait for the DOM to be loaded
$(document).ready(function() {
    // bind 'myForm' and provide a simple callback function
    $('#formular').ajaxForm(function() {
        alert("Thank you for your comment!");
    });
});*/