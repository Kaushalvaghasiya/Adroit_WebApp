(function ($) {
    $.fn.inputFilter = function (inputFilter) {
        return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function () {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            }
        });
    };


}(jQuery));

(function ($) {
    $('.numberonly').keypress(function (e) {
        var charCode = (e.which) ? e.which : e.keyCode

        if (String.fromCharCode(charCode).match(/[^0-9]/g))

            return false;
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
function showInfo(title, message) {
    swal(title, message, "info");
}
function notySuccess(message) {
    notif({
        msg: message,
        type: "success"
    });
}
function notyError(message) {
    notif({
        msg: message,
        type: "error"
    });
}
function notyWarning(message) {
    notif({
        msg: message,
        type: "warning"
    });
}
function notyInfo(message) {
    notif({
        msg: message,
        type: "info"
    });
}

function isEmail(email) {
    var regex = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
    if (regex.test(email)) {
        return true;
    }
    else {
        return false;
    }
}
function isNumber(text) {
    return /^\d*$/.test(text);
}

$(function () {
    'use strict'
    // Datepicker
    try {
        bindDatePicker();
    } catch (e) {

    }
});

function bindDatePicker() {
    $('.fc-datepicker').datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: 'dd/mm/yy'
        /*numberOfMonths: 2*/
    });
}

function setScreenMode(readonly) {
    $(".mode-ed").each(function (index, element) {
        $(this).prop('disabled', readonly);
    });

    $(".mode-hide").each(function (index, element) {
        if (readonly) {
            $(this).hide();
        } else {
            $(this).show();
        }
    });

    $(".mode-ed-multi").each(function (index, element) {
        //$(".mode-ed-multi").multipleSelect(readonly ? 'disable' : 'enable');
        //This is removing selected items, so commented out.
    });

}

function gridInitComplete(table) {
    table.buttons().container().appendTo('#tblMain_wrapper .col-md-6:eq(0)');

    $(".buttons-copy").removeClass("btn-primary");
    $(".buttons-copy").addClass("btn-outline-primary");

    $(".buttons-excel").removeClass("btn-primary");
    $(".buttons-excel").addClass("btn-outline-primary");

    $(".buttons-colvis").removeClass("btn-primary");
    $(".buttons-colvis").removeClass("dropdown-toggle");
    $(".buttons-colvis").addClass("btn-outline-primary sub-icon");

    $(".buttons-copy").empty();
    $(".buttons-copy").append('<i class="fa fa-copy" data-toggle="tooltip" title="Copy" data-original-title="fa fa-copy"></i>');

    $(".buttons-excel").empty();
    $(".buttons-excel").append('<i class="fa fa-file-excel-o" data-toggle="tooltip" title="Excel" data-original-title="fa fa-file-excel-o"></i>');

    $(".buttons-colvis").empty();
    $(".buttons-colvis").append('<i class="fa fa-eye" data-toggle="tooltip" title="Column Visibility" data-original-title="fa fa-eye"></i>');
}

function gridDrawCallback(row) {
    $(".btn-edit").on("click", function () {
        //editMode(parseInt($(row).attr("data-value")));
        editMode(parseInt($(this).attr("data-value")));
    });

    $(".btn-view").on("click", function () {
        //viewMode(parseInt($(row).attr("data-value")));
        viewMode(parseInt($(this).attr("data-value")));
    });

    $(".btn-delete-grid").on("click", function () {
        //deleteItemConfirmation(parseInt($(row).attr("data-value")));
        deleteItemConfirmation(parseInt($(this).attr("data-value")));
    });
    $(".btn-cancel-grid").on("click", function () {
        //deleteItemConfirmation(parseInt($(row).attr("data-value")));
        cancelItemConfirmation(parseInt($(this).attr("data-value")));
    });
}

function deleteItemConfirmation(id) {
    swal({
        title: "Alert",
        text: "Are you really want to delete?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel'
    }, function (isconfirmed) {
        if (isconfirmed) {
            deleteItem(id == 0 ? $('#Id').val() : id);
        }
    });
}

function cancelItemConfirmation(id) {
    swal({
        title: "Alert",
        text: "Are you sure you want to cancel?",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: 'Yes, Cancel It',
        cancelButtonText: 'No'
    }, function (isconfirmed) {
        if (isconfirmed) {
            deleteItem(id == 0 ? $('#Id').val() : id);
        }
    });
}
function getDate(value) {
    var data = value.split('/');
    return data[2] + '/' + data[1] + '/' + data[0];
}

function isNumber(text) {
    return /^\d*$/.test(text);
}

function getIntValueNull(elementId) {
    return (isNaN(parseInt($("#" + elementId).val())) ? null : parseInt($("#" + elementId).val()));
}

function getIntValueZero(elementId) {
    return (isNaN(parseInt($("#" + elementId).val())) ? 0 : parseInt($("#" + elementId).val()));
}

function getFloatValueNull(elementId, decimalPoints) {
    return (isNaN(parseFloat($("#" + elementId).val())) ? null : parseFloat($("#" + elementId).val()).toFixed(decimalPoints));
}

function getFloatValueZero(elementId, decimalPoints) {
    return (isNaN(parseFloat($("#" + elementId).val())) ? 0.00 : parseFloat($("#" + elementId).val()).toFixed(decimalPoints));
}

function validatePercentage(x) {
    var parts = x.split(".");
    if (parts[1] == "") {
        parts[1] = "00"
    }
    if (typeof parts[1] == "string" && (parts[1].length == 0 || parts[1].length > 2))
        return false;
    var n = parseFloat(x);
    if (isNaN(n))
        return false;
    if (n < 0 || n > 100)
        return false;

    return true;
}