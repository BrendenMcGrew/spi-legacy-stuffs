$(function () {

    //tab controller, takes us to a particualar tab based on string value in hidden box
    var uploadStatus = this.getElementById("WhichTab").value;

    $("#tabs").tabs({       
        heightStyle: "content"   
    });
    if (uploadStatus == "Upload")
        $("#tabs").tabs({ active: 3 })  // takes up to upload document tab
    else if (uploadStatus == "Incident")
        $("#tabs").tabs({ active: 6 })  //takes us to incident tab
    else
        $("#tabs").tabs({ active: 0 })  //default is personnel tab
});

function CharCount() {
    var Characters = 3000 - (document.getElementById('IncidentNotes').value.length);
    document.getElementById('WordCount').innerHTML = "You have " + Characters + " characters Left.";
}

$(document).ready(function () {
    $('#tblMemberIncident').DataTable({
        "columns": [
            {
                data: "AdjudicationGuideline",
                title: "Adjudication Guideline",
                className: "text-nowrap",
                render: function (ID, type, row) {
                    return row.AdjudicationGuideline;
                    //return '<a href="/EmployeeDetails/EmployeeDetails/?RowID=' + encodeURIComponent(ID) + '&File=' + "XX" + '">' + row.FullName + '</a>';
                },
                width: "14%"
            },
            {
                data: "OpenDate",
                title: "Open Date",
                render: function (OpenDate, type, row) {
                    return row.OpenDate;
                },
                width: "30%"
            },
            {
                data: "CloseDate",
                title: "Close Date",
                render: function (CloseDate, type, row) {
                    return row.CloseDate;
                },
                width: "30%"
            }
        ],
        "order": [[1, 'asc']]
    });
    init();

    function init() {
        //function to get personel table
        $.ajax({
            url: '/EmployeeDetails/About',
            type: 'post',
            dataType: 'json',
            data: {},
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                drawTableTest(response);
            }
        })
    }


    function drawTableTest(data) {
        var datatable = $('#tblMemberIncident').dataTable().api();
        var employees = JSON.parse(data);
        datatable.rows.add(employees.data);
        datatable.draw();
    }

});

