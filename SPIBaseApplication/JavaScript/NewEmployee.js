$(document).ready(function () {
    var today = new Date();
    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    document.getElementById("InprocessDate").value = "2021-10-8";
});

//$(document).ready(function () {
//    $(function () {
//        $(".date-select").datepicker({ dateFormat: 'dd.mm.yy' });
//        $(".date-select").datepicker($.datepicker.regional['sl']);
//    });
//    $(function () {
//        $("#InprocessDate").datepicker('setDate', new Date());
//    });
//});

function pullData() {
    var hasError = false;
    var Errors = [];
    var UScitizen;

    //Checks for any empty required fields and adds them to a list of errors to be displayed.
    if (!$('#txtfirstname').val()) {
        hasError = true;
        Errors.push(' First Name')
    }

    if (!$('#txtlastname').val()) {
        hasError = true;
        Errors.push(' Last Name')
    }

    if ($('#txtssn').val().length != 11) {
        hasError = true;
        Errors.push(' Social Security Number')
    }

    if (!$('#txtdodid').val()) {
        hasError = true;
        Errors.push(' DOD ID Number')
    }

    if (!$('#txtunit').val()) {
        hasError = true;
        Errors.push(' Unit')
    }

    if ($('#personalPhone').val().length != 12) {
        hasError = true;
        Errors.push(' Phone Number')
    }

    if (!$('#DateOfBirth').val()) {
        hasError = true;
        Errors.push(' Date of Birth')
    }

    if (!$('#txtBirthCity').val()) {
        hasError = true;
        Errors.push(' Birth City')
    }

    if (!$('#txtBirthCountry').val()) {
        hasError = true;
        Errors.push(' Birth Country')
    }

    if (!$('#workemail').val()) {
        hasError = true;
        Errors.push(' Email')
    }


    //Only pulls all the data if every required field was filled out
    if (hasError == false) {
        var personalData = [
            //Basic info
            $('#txtfirstname').val().toUpperCase(),
            $('#txtmiddlename').val().toUpperCase(),
            $('#txtlastname').val().toUpperCase(),
            $('#txtssn').val(),
            $('#txtdodid').val(),
            $('#cboRank').val(),
            $('#txtunit').val().toUpperCase(),
            $('#txtofficesymbol').val().toUpperCase(),
            $('#txtattached').val().toUpperCase(),
            $('#txtpafsc').val().toUpperCase(),
            $('#txtdsn').val(),
            $('#InprocessDate').val(),
            $('#InprocessedBy').val().toUpperCase(),

            //Personal info
            $('#txtheight').val().toUpperCase(),
            $('#txtweight').val().toUpperCase(),
            $('#cbohairColor').val().toUpperCase(),
            $('#cboeyeColor').val().toUpperCase(),
            $('#personalPhone').val().toUpperCase(),
            $('#txtzipcode').val().toUpperCase(),
            $('#txtAddress').val().toUpperCase(),
            $('#txtCurrentCity').val().toUpperCase(),
            $('#cboCurrentState').val().toUpperCase(),

            //Clearance info
            $('#cboClearance').val().toUpperCase(),
            $('#cboInvestigationType').val().toUpperCase(),
            $('#txtClearanceStatus').val().toUpperCase(),
            $('#InvestigationCloseDate').val().toUpperCase(),
            $('#DateOfBirth').val().toUpperCase(),
            $('#txtBirthCity').val().toUpperCase(),
            $('#cboBirthState').val().toUpperCase(),
            $('#txtBirthCountry').val().toUpperCase(),
            $('#isSCI').prop('checked'),
            $('#workemail').val().toUpperCase(),

            //Clearance table info
            $('#txtEligibility').val().toUpperCase(),
            $('#EligibilityDate').val().toUpperCase(),
            $('#isCitizen').val().toUpperCase(),
            $('#ceDefermentDate').val().toUpperCase()
        ];

        $.ajax({
            url: '/NewEmployee/CreateNewEntry',
            type: 'post',
            dataType: 'json',
            data: { PersonalData: personalData },
            success: function (data) {
                if (!data.success) {
                    alert(data.message);
                }
                else {
                    alert(data.message);
                }
            },
            error: function () {
                alert("An Error Occured");
            }
        });
    }
    //Displays what fields still need to be filled in one alert
    else {
        alert("The following fields cannot be left empty: \n \n" + Errors);
    }
    Errors = "";
}

function lettersOnly(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
        ((evt.which) ? evt.which : 0));
    if (charCode > 31 && charCode != 32 && charCode != 39 && (charCode < 45 || charCode > 46) && (charCode < 65 || charCode > 90) &&
        (charCode < 97 || charCode > 122)) {
        return false;
    }
    return true;
}

function NumbersOnly(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
        ((evt.which) ? evt.which : 0));
    if (charCode < 48 || charCode > 57) {
        return false;
    }
    return true;
}


function AddDashes(evt) {
    var currentElem = evt.srcElement.id;
    var regPatt;
    var regMatch;
    if (currentElem == "txtssn") {
        regPatt = new RegExp("\d{3}[\-]\d{2}[\-]\d{4}");
        regMatch = /(\d{0,3})(\d{0,2})(\d{0,4})/;
    }
    else if (currentElem == "personalPhone") {
        regPatt = new RegExp("^[(]{1}[0-9]{3}[)]{1}[-]{1}[0-9]{3}[-]{1}[0-9]{4}$");
        regMatch = /(\d{0,3})(\d{0,3})(\d{0,4})/;
    }
    else if (currentElem == "txtdsn") {
        regPatt = new RegExp("\d{3}[\-]\d{4}");
        regMatch = /(\d{0,3})(\d{0,4})/;
    }
    
    var x = document.getElementById(currentElem);
    var res = regPatt.test(x.value)
    if (!res) {
        x.value = x.value
            .match(/\d*/g).join('')
            .match(regMatch).slice(1).join('-')
            .replace(/-*$/g, '');
    }
}

function RemoveDashes(evt) {
    var currentElem = evt.srcElement.id;
    var SSNval = document.getElementById(currentElem);
    SSNval.value = SSNval.value.replaceAll("-", "");
}