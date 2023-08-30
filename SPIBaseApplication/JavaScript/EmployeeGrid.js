$(document).ready(function () {

    $("#tblEmployees").DataTable({
        "columns": [
            {
                data: "ID",
                title: "Name",
                className: "text-nowrap",                
                render: function (ID, type, row) {
                    //return row.FullName;
                    return '<a href="/EmployeeDetails/EmployeeDetails/?RowID=' + encodeURIComponent(ID) + '&File=' + "XX" + '">' + row.FullName + '</a>';
                },
                width: "14%"
            },
            {
                data: "Rank",
                title: "Rank",
                render: function (Rank, type, row) {
                    return row.Rank;
                },
                width: "10%"
            },  
            {
                data: "Clearance",
                title: "Clearance",
                className: "text-nowrap",
                render: function (Clearance, type, row) {                    
                    return row.Clearance;
                },
                width: "13%"
            },
            {
                data: "InvestType",
                title: "InvestType",
                className: "text-nowrap",
                render: function (InvestType, type, row) {
                    return row.InvestType;
                },
                width: "13%"
            },
            {
                data: "InvestDate",
                title: "Investigation Close Date",
                className: "text-nowrap",
                render: function (InvestDate, type, row) {
                    return row.InvestDate;
                },
                width: "7%"
            }
        ],
        createdRow: function (row, data, dataIndex) {
            var investCloseDate = new Date(data.InvestDate);
            var year = investCloseDate.getFullYear();
            var month = investCloseDate.getMonth();
            var day = investCloseDate.getDate();
            var secretDueDateRed = new Date(year + 10, month, day);//Secret date when needed to turn red
            var secretDueDateYellow = new Date(year + 10, month, day - 120);//Secret date when needed to turn yellow
            var topSecretDueDateRed = new Date(year + 6, month, day - 90);// Top Secret date when needed to turn red
            var topSecretDueDateYellow = new Date(year + 6, month, day - 120);// Top Secret date when needed to turn yellow
            var color = "";
           
            const today = new Date();
            //Forthcoming rules and coloring for clearance
            if (data.Clearance == "Secret")
            {           
                color = secretDueDate(today, secretDueDateRed, secretDueDateYellow, color);                  
            }
            //Forthcoming rules and coloring for clearance
            if (data.Clearance == "Top Secret")
            {               
                color = secretDueDate(today, topSecretDueDateRed, topSecretDueDateYellow, color);
            }
            switch (color) {
                case "Red":
                    $(row).attr("style", "background:#F8D7DA");
                    color = "";
                    break;
                case "Yellow":
                    $(row).attr("style", "background:rgb(255 216 0 / 0.40)");
                    color = "";
                    break;
                default:           
                    break;
            }   
        },
        order: [[1, 'asc']], //order by full name by default

        //buttons potentially??         
        //initComplete: function () {
        //    $('div.dataTables_filter input').focus();
        //}
        });
    });
    init(); 

function init() {
    //function to get personel table
    $.ajax({
        url: '/Employee/EmployeeGridJSON',
        type: 'post',
        dataType: 'json',
        data: {},
        contentType: "application/json; charset=utf-8",     
        success: function (response) {               
            drawTable(response);            
        }        
    })  
}

function drawTable(data) {
    var datatable = $('#tblEmployees').dataTable().api();
    var employees = JSON.parse(data);
    datatable.rows.add(employees.data);  
    datatable.draw();  
}

function secretDueDate(today, dueDateRed, dueDateYellow, color) {    
    if (today >= dueDateRed)//Filler code, real code sets red or yellow
        color = "Red"; 
    else if (today >= dueDateYellow)
        color = "Yellow";    

    return color;
}

function editKey(valkey)
{    
    alert(valkey);
}


