$(document).ready(function() {
    //console.log($(el).data('task-id'))
    //$('.js-example-basic-multiple').select2();
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
        var segmId = $(el).closest("ul").data('seg-id');//$(el).data('seg-id');

    console.log(segmId)
        $.ajax({
            url: "/changeSegment?taskId="+taskId+"&segmentId="+segmId,
            cache: false
        })
            .done(function( html ) {
                alert('hat funktioniert:' + segmId);
            });
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
// AJAX Submit Task
/*const form = {
    task_name: document.getElementById('task_name_input'),
    task_description: document.getElementById('task_description_input'),
    task_project: document.getElementById('task_project_input'),
    task_segment: document.getElementById('task_segment_input'),
    task_submit:document.getElementById('task_submit')
};
form.task_submit.addEventListener('click',() =>{
    console.log('button pressed')
    const request = new XMLHttpRequest();
    request.onload = () =>{
        console.log(request.responseText)
    };
    const requestData = `name=${form.task_name.value}&description=${form.task_description.value}`;
console.log(requestData)
    request.open('post','task.php');
    request.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    request.send(requestData);
});*/
/*
//NÄCHSTER VERSUCH -....
$('form.inputTask').on('submit',function () {
    var that = $(this),
        url = that.attr('action'),
        method = that.attr('method'),
        date = {};
    that.find('[name]').each(function () {
        var that = $(this),
            name = that.attr('name'),
            value = that.val();
        data[name] = value;
    });
    $.ajax({
       url: url,
       type: type,
       data: data,
       success: function (response) {
            console.log(response);
       }
    });
    return false;
})
 */
//Krausler GET Ansatz
/*
$.ajax({
    url: "/task/1/DONE",
    cache: false
})
    .done(function( html ) {
        alert('hat funktioniert');
    });
    */