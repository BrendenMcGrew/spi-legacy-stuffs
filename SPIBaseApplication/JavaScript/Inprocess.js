$(document).ready(function () {

    $("#tblInProcessEmployees").DataTable({
        "columns": [
            {
                data: "InOutProcess",
                title: "",
                className: "text-nowrap",
                'render': function (InOutProcess, type, full, meta) {
                    return '<input type="checkbox" value="' + 0 + '">';
                },
                width: "5%"
            },
            {
                data: "ID",
                title: "Name",
                className: "text-nowrap",
                render: function (ID, type, row) {
                    return '<a href="/EmployeeDetails/EmployeeDetails/?RowID=' + encodeURIComponent(ID) + '&File=' + "XX" + '">' + row.FullName + '</a>';
                },
                width: "40%"
            },
            {
                data: "ProcessDate",
                title: "Processed Date",
                render: function (ProcessDate, type, row) {
                    return row.ProcessDate;
                },
                width: "40%"
            }
        ],
        order: [[1, 'asc']], //order by full name by default
    });

    $("#tblOutProcessEmployees").DataTable({
        "columns": [
            {
                data: "InOutProcess",
                title: "",
                className: "text-nowrap",
                'render': function (InOutProcess, type, full, meta) {
                    //return row.FullName;
                    return '<input type="checkbox" value="' + 0 + '">';
                },
                width: "5%"
            },
            {
                data: "ID",
                title: "Name",
                className: "text-nowrap",
                render: function (ID, type, row) {
                    //return row.FullName;
                    return '<a href="/EmployeeDetails/EmployeeDetails/?RowID=' + encodeURIComponent(ID) + '&File=' + "XX" + '">' + row.FullName + '</a>';
                },
                width: "30%"
            },
            {
                data: "Reason",
                title: "Reason",
                className: "text-nowrap",
                render: function (Reason, type, row) {
                    return row.Reason;
                },
                width: "30%"
            },
            {
                data: "ProcessDate",
                title: "Processed Date",
                render: function (ProcessDate, type, row) {
                    return row.ProcessDate;
                },
                width: "30%"
            }
        ],
        order: [[1, 'asc']], //order by full name by default
    });
});
init();

function init() {
    //function to get personel table
    $.ajax({
        url: '/Process/InProcess',
        type: 'post',
        dataType: 'json',
        data: {},
        contentType: "application/json; charset=utf-8",
        success: function (response) {
            drawTableIn(response);
        }
    })
    $.ajax({
        url: '/Process/OutProcess',
        type: 'post',
        dataType: 'json',
        data: {},
        contentType: "application/json; charset=utf-8",
        success: function (response) {
            drawTableOut(response);
        }
    })
}

function drawTableIn(data) {
    var datatable = $('#tblInProcessEmployees').dataTable().api();
    var employees = JSON.parse(data);
    datatable.rows.add(employees.data);
    datatable.draw();
}
function drawTableOut(data) {
    var datatable = $('#tblOutProcessEmployees').dataTable().api();
    var employees = JSON.parse(data);
    datatable.rows.add(employees.data);
    datatable.draw();
}



