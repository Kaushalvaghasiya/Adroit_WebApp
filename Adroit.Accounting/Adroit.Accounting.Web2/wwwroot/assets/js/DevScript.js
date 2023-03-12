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
