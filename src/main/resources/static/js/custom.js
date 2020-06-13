$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});



/* Custom Dragula JS */



dragula([
    document.getElementById("to-do"),
    document.getElementById("in-progress"),
    document.getElementById("done")
])
removeOnSpill: false
    .on("drag", function(el) {
        el.className.replace("ex-moved", "");
    })
    .on("drop", function(el) {
        el.className += "ex-moved";
    })
    .on("over", function(el, container) {
        container.className += "ex-over";
    })
    .on("out", function(el, container) {
        container.className.replace("ex-over", "");
    });



/*// wait for the DOM to be loaded
$(document).ready(function() {
    // bind 'myForm' and provide a simple callback function
    $('#formular').ajaxForm(function() {
        alert("Thank you for your comment!");
    });
});*/
 