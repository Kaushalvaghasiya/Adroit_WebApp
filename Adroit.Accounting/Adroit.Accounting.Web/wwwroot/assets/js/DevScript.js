(function ($) {

})(jQuery);

function AjaxCall(methodtype, url, data, succesmethodname, errormethodname) {
    var returndata;
    $.ajax({
        url: url,
        type: methodtype,
        data: data,
        async: true,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: succesmethodname,
        error: errormethodname
    });
    //contentType: "application/json; charset=utf-8",
}

function blockUI(id) {
    KTApp.block(`#${id}`, {
        overlayColor: '#000000',
        state: 'danger',
        message: 'Please wait...'
    });
}
function unblockUI(id) {
    KTApp.unblock(`#${id}`);
}

function ShowSuccessMessage(message) {
    swal('Success', message, "success");
}
function ShowErrorMessage(message) {
    swal('Error', message, "error");
}
