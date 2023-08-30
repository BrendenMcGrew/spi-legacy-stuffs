function PushIncident() {
    var hasError = false;
    var Errors = [];

    //Checks for any empty required fields and adds them to a list of errors to be displayed.
    //if (!$('#txtfirstname').val()) {
    //    hasError = true;
    //    Errors.push('First name ')
    //}

    //if (!$('#txtlastname').val()) {
    //    hasError = true;
    //    Errors.push('Last name ')
    //}

    //if (!$('#txtmiddlename').val()) {
    //    hasError = true;
    //    Errors.push('Middle name ')
    //}

    //if (!$('#txtssn').val()) {
    //    hasError = true;
    //    Errors.push('Social security number ')
    //}

    //if (!$('#txtdodid').val()) {
    //    hasError = true;
    //    Errors.push('DOD ID number ')
    //}

    ////if (!$('#txtrank').val()) {
    ////    hasError = true;
    ////    Errors.push('Rank ')
    ////}

    //if (!$('#txtunit').val()) {
    //    hasError = true;
    //    Errors.push('Unit ')
    //}

    if (!$('#IncidentNotes').val()) {
        hasError = true;
        Errors.push('Incident Notes \n');
    }


    if (!$('#dboIncidentDate').val()) {
        hasError = true;
        Errors.push('Incident Date \n ');
    }

    //Only pulls all the data if every required field was filled out
    if (hasError == false) {
        var incidentData = [
            //Incident Info
            $('#dboIncidentDate').val(),
            $('#dboReportDate').val(),
            $('#ckbSelfReport').prop('checked'),
            $('#ddlAdjudications').val(),
            $('#dboCloseDate').val(),
            $('#ddlVerdict').val()
        ];

        var Notes = $('#IncidentNotes').val();
        var FullHeaderName = document.getElementById('FullName').innerText;

        $.ajax({
            url: '/EmployeeDetails/SavingData',
            type: 'post',
            dataType: 'text',
            data: { IncidentData: incidentData, Notes: Notes, FullName: FullHeaderName },
            success: function () {
                alert("Incident created successfully");
            },
            error: function () {
                alert("An error occurred");
            }
        });
    }
    //Displays what fields still need to be filled in one alert
    else {
        alert("The following fields cannot be left empty: \n " + Errors);
    }
    Errors = "";
}

//function lettersOnly(evt) {
//    evt = (evt) ? evt : event;
//    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
//        ((evt.which) ? evt.which : 0));
//    if (charCode > 31 && charCode != 32 && charCode != 39 && (charCode < 45 || charCode > 46) && (charCode < 65 || charCode > 90) &&
//        (charCode < 97 || charCode > 122)) {
//        return false;
//    }
//    return true;
//}

//function NumbersOnly(evt) {
//    evt = (evt) ? evt : event;
//    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
//        ((evt.which) ? evt.which : 0));
//    if (charCode < 48 || charCode > 57) {
//        return false;
//    }
//    return true;
//}
