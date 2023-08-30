
//$(document).ready(function () {

//    init();

//    function init() {

//        //function to get personel table
//        $.ajax({
//            url: '/Process/IncidentReports',
//            type: 'post',
//            dataType: 'json',
//            contentType: "application/json; charset=utf-8",

//            success: function (response) {
//                response1 = JSON.parse(response);
//                var trHTML = '';
//                var trHTMLNameLine = '';
//                var ID = '';
//                var EndBody = true;

//                $.each(response1, function (i, item) {
//                    for (var j in item) {
//                        //loops through each person until the ID changes to another person
//                        if (item[j].ID != ID) {
//                            if (!EndBody) {
//                                $('#tblEmployeeIncidents').append(trHTMLNameLine);
//                                $('#tblEmployeeIncidents').append(trHTML);
//                                trHTMLNameLine = '';
//                                trHTML = '';
//                            }

//                            //builds name title and incident headers part of HTML
//                            trHTMLNameLine += '<tr><td style="width:40%"><a href="/EmployeeDetails/EmployeeDetails/?RowID=' + encodeURIComponent(item[j].ID) + '&Result=' + "Incident" + '&File=' + "XX" + '">' + item[j].FullName + '</td></tr>';
//                            trHTML += '<tr><th style="width:40%">&nbsp;&nbsp;&nbsp; Incident Type </th><th> Open Date </th><th> CloseDate </th></tr>';

//                            EndBody = false;
//                        }

//                        //build incendent part of HTML
//                        trHTML += '<tr><td style="width:40%">&nbsp;&nbsp;&nbsp;' + item[j].IncidentType + '</td><td>' + item[j].OpenDate + '</td><td>' + item[j].CloseDate + '</td></tr >';
//                        ID = item[j].ID;
//                    }
//                });

//                $('#tblEmployeeIncidents').append(trHTMLNameLine);
//                $('#tblEmployeeIncidents').append(trHTML);
//            }
//        })
//    }
//});

$(document).ready(function () {
    var groupColumn = 5;

    $("#tblEmployeeIncidents").DataTable({
        "columnDefs": [
            { "visible": false, "targets": groupColumn }
        ],
        //"order": [[groupColumn, 'asc']],
        "displayLength": 25,
        "drawCallback": function (settings) {
            var api = this.api();
            var rows = api.rows({ page: 'current' }).nodes();
            var last = null;

            api.column(groupColumn, { page: 'current' }).data().each(function (group, i) {
                var splitVal = group.split('/')
                if (last !== group) {
                    $(rows).eq(i).before(
                        '<tr class="group"><td colspan="3"><a href ="/EmployeeDetails/EmployeeDetails/?RowID=' + encodeURIComponent(splitVal[1]) + '&File=' + "XX" + '&Result=' + "Incident" + '">' + splitVal[0] + '</a></td></tr>',
                        '<th>Incident Type<td><b>Open Date<td><b>Close Date</td></th > '
                    );

                    last = group;
                }
            });
        },

        "columns": [
            {
                data: "FullName",
                title: "Name",
                className: "text-nowrap",
                visible: false,
                render: function (FullName, type, row) {
                    return row.FullName;
                    //return '<a href="/EmployeeDetails/EmployeeDetails/?RowID=' + encodeURIComponent(row.UniqueKey) + '&File=' + "XX" + '">' + row.FullName + '</a>';
                },
                width: "40%"
            },
            {
                data: "UniqueKey",
                visible: false,
                render: function (UniqueKey, type, row) {
                    return row.UniqueKey;
                },
                width: "20%"
            },
            {
                data: "AdjudicationGuideline",
                title: "",
                className: "text-nowrap",
                render: function (IncidentType, type, row) {
                    return row.AdjudicationGuideline;
                },
                width: "40%"
            },
            {
                data: "OpenDate",
                title: "",
                className: "text-nowrap",
                render: function (IncidentOpenDate, type, row) {
                    return row.OpenDate;
                },
                width: "40%"
            },
            {
                data: "CloseDate",
                title: "",
                className: "text-nowrap",
                render: function (IncidentCloseDate, type, row) {
                    return row.CloseDate;
                },
                width: "40%"
            },
            {
                data: "IncidentFormatColumn",
                title: "",
                className: "text-nowrap",
                render: function (IncidentCloseDate, type, row) {
                    return row.IncidentFormatColumn;
                },
                width: "20%"
            }
        ]
    });

    init();

    function init() {
        //function to get personel table
        $.ajax({
            url: '/Process/IncidentReports',
            type: 'post',
            dataType: 'json',
            data: {},
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                //alert(response);
                drawTable(response);
            }
        })
    }

    function drawTable(data) {
        var datatable = $('#tblEmployeeIncidents').dataTable().api();
        var employees = JSON.parse(data);
        datatable.rows.add(employees.data);
        datatable.draw();
    }

    // Order by the grouping
    $('#tblEmployeeIncidents tbody').on('click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
            table.order([groupColumn, 'desc']).draw();
        }
        else {
            table.order([groupColumn, 'asc']).draw();
        }
    });

    //function init() {

    //    //function to get personel table
    //    $.ajax({
    //        url: '/Test/About',
    //        type: 'post',
    //        dataType: 'json',           
    //        contentType: "application/json; charset=utf-8",

    //        success: function (response) {
    //            response1 = JSON.parse(response);              
    //            var trHTML = '';             
    //            var trHTMLNameLine = '';
    //            var ID = '';
    //            var EndBody = true;         

    //            $.each(response1, function (i, item) {
    //                for (var j in item) {
    //                    //loops through each person until the ID changes to another person
    //                    if (item[j].ID != ID) {
    //                        if (!EndBody) {                               
    //                            $('#tblexample').append(trHTMLNameLine);
    //                            $('#tblexample').append(trHTML);
    //                            trHTMLNameLine = '';
    //                            trHTML = '';
    //                        }    

    //                        //builds name title and incident headers part of HTML
    //                        trHTMLNameLine += '<tr><td style="width:40%"><a href="/EmployeeDetails/EmployeeDetails/?RowID=' + encodeURIComponent(item[j].ID) + '&Result=' + "Incident" + '&File=' + "XX" + '">' + item[j].FullName + '</td></tr>';                            
    //                        trHTML += '<tr><th style="width:40%">&nbsp;&nbsp;&nbsp; Incident Type </th><th> Open Date </th><th> CloseDate </th></tr>';

    //                        EndBody = false;                            
    //                    }   

    //                    //build incendent part of HTML
    //                    trHTML += '<tr><td style="width:40%">&nbsp;&nbsp;&nbsp;' + item[j].IncidentType + '</td><td>' + item[j].OpenDate + '</td><td>' + item[j].CloseDate + '</td></tr >';
    //                    ID = item[j].ID;                       
    //                }  
    //            });        

    //            $('#tblexample').append(trHTMLNameLine);     
    //            $('#tblexample').append(trHTML);
    //        }      
    //    })     
    //}    
});