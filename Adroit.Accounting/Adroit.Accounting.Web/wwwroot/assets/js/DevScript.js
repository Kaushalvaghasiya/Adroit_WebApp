(function ($) {
    // remover space
    $("input").on('blur', function () {
        if ($(this).context.type != "file") {
            $(this).val($(this).val().trim());
        }
    });
    $("textarea").on('blur', function () {
        $(this).val($(this).val().trim());
    });
    //add numeric class for number validation 
    $('.numeric').on('input', function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });

    //Disable paste
    $(".numeric").bind("paste", function (e) {
        e.preventDefault();
    });

    //called when key is pressed in textbox
    $(".numeric").bind('keypress', function (e) {
        if ((this.value === "" || parseInt(this.value) === 0) && (e.which === 48 || e.which === 8)) {
            this.value = "";
            return false;
        }

        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            return false;
        }
        return true;
    });

    $(".numeric").bind('keyup', function (e) {
        if ((this.value === "" || parseInt(this.value) === 0) && (e.which === 48 || e.which === 8)) {
            this.value = "";
            return false;
        }
        return true;
    });

    // allow decimal input only
    $(".decimal").on("keypress keyup blur", function (event) {
        $(this).val($(this).val().replace(/[^0-9\.]/g, ''));
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });

    //add numeric class for number validation 
    $('.numericSpeed').on('input', function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });

    //Disable paste
    $(".numericSpeed").bind("paste", function (e) {
        e.preventDefault();
    });

    //called when key is pressed in textbox
    $(".numericSpeed").bind('keypress', function (e) {
        if (e.which !== 8 && e.which !== 0 && (e.which < 47 || e.which > 57)) {
            return false;
        }
        return true;
    });

    //Disable paste
    $(".floats").bind("paste", function (e) {
        e.preventDefault();
    });

    $(".floats").bind('keyup', function (e) {
        if (this.value === "" && e.which === 46) {
            this.value = "";
            return false;
        }
        if (!CheckDecimal(this)) {
            this.value = "";
        }
        return true;
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

function fnReset() {

    $('select option[value=""]').attr("selected", true);

    var ele = document.getElementsByClassName('userform');
    $("input[type=hidden]").each(function () {
        $(this).val('');
    });

    $('input.form-control').val('');
    $('textarea.form-control').val('');

    //var errorlab = document.getElementsByClassName('label1');
    //var i;
    //for (i = 0; i < errorlab.length; i++) {
    //    errorlab[i].textContent = "";
    //}

    for (i = 0; i < ele.length; i++) {
        if (ele[i].tagName === 'INPUT') {
            ele[i].value = '';
            if (ele[i].type === 'file') {
                ele[i].defaultValue = '';
            }
            if (ele[i].type === 'checkbox') {
                ele[i].checked = false;
            }
        }
        else if (ele[i].tagName === 'TEXTAREA') {

            $(ele[i]).empty();
            $(ele[i]).val('');
            if (typeof window.CKEDITOR != "undefined") {
                for (window.instance in window.CKEDITOR.instances) {
                    if (window.CKEDITOR.instances.hasOwnProperty(window.instance)) {
                        // CKEDITOR.instances[instance].updateElement();
                        window.CKEDITOR.instances[window.instance].setData('');
                    }
                }
            }
        }
        else if (ele[i].tagName === 'LABEL') {
            $('#' + ele[i].id).empty();
            if (document.getElementById(ele[i].id)) {
                document.getElementById(ele[i].id).innerHTML = "";
            }
        }

        else if (ele[i].tagName === 'SELECT') {
            if (document.getElementById(ele[i].id)) {
                document.getElementById(ele[i].id).value = "";
            }
        }       
    }

    var elecheck = document.getElementsByClassName('chkactive');
    for (i = 0; i < elecheck.length; i++) {
        elecheck[i].checked = true;
    }

    var eleuncheck = document.getElementsByClassName('chkinactive');
    for (i = 0; i < eleuncheck.length; i++) {
        eleuncheck[i].checked = false;
    }
}