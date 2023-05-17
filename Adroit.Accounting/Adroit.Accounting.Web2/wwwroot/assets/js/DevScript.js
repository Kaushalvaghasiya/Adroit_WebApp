(function ($) {
    $('.numberonly').keypress(function (e) {

        var charCode = (e.which) ? e.which : event.keyCode

        if (String.fromCharCode(charCode).match(/[^0-9]/g))

            return false;

    });
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

function blockUI() {
    $("#global-loader").fadeIn("slow");
}
function unblockUI() {
    $("#global-loader").fadeOut("slow");
}

function showSuccess(title, message) {
    swal(title, message, "success");
    //swal('Congratulations!', 'Your message has been succesfully sent', 'success');
}
function showError(title, message) {
    swal(title, message, "error");
}
function showWarning(title, message) {
    swal(title, message, "warning");
}

function IsEmail(email) {
    var regex =
        /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!regex.test(email)) {
        return false;
    }
    else {
        return true;
    }
}

$(function () {
    'use strict'
    // Datepicker
    $('.fc-datepicker').datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        /*numberOfMonths: 2*/
    });
});
