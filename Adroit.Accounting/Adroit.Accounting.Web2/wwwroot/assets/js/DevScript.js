(function ($) {
    $('.numberonly').keypress(function (e) {
        var charCode = (e.which) ? e.which : event.keyCode

        if (String.fromCharCode(charCode).match(/[^0-9]/g))

            return false;
    });
})(jQuery);

$(".Money3").inputFilter(function (value) {
    return /^\d*[.]?\d{0,3}$/.test(value);
});

$(".money").inputFilter(function (value) {
    return /^\d*[.]?\d{0,2}$/.test(value);
});

$(".integer").inputFilter(function (value) {
    return /^\d*$/.test(value);
});

$(".time").keypress(function (event) {
    var regexs = [/[0-2]/, /[0-9]/, /:/, /[0-5]/, /[0-9]/];
    var key = event.which;
    var string = $(this).val() + String.fromCharCode(key)
    var characters = string.split("");
    var isBackspace = key === 8;
    var shouldTest = characters.length < 5 && !isBackspace;
    var passed = !(characters.length > 5 && !isBackspace);
    if (shouldTest) {
        for (var i = 0; i < characters.length; i++) {
            var character = characters[i];
            var regex = regexs[i];
            var testFailed = !regex.test(character);
            if (testFailed) {
                passed = false;
                break;
            }
        }
    }
    if (passed) {
        characters = string.split(":");
        if (characters[0] == "") {
            passed = false;
        }
        else {
            passed = (parseInt(characters[0]) <= 23);
        }
    }
    return passed;
});
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
function showInfo(title, message) {
    swal(title, message, "info");
}

function IsEmail(email) {
    var regex = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
    if (regex.test(email)) {
        return true;
    }
    else {
        return false;
    }
}

$(function () {
    'use strict'
    // Datepicker
    try {
        $('.fc-datepicker').datepicker({
            showOtherMonths: true,
            selectOtherMonths: true,
            /*numberOfMonths: 2*/
        });
    } catch (e) {

    }
});