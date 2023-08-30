
function SavingNotes() {
    alert("called function");
        $.ajax({
            url: '/EmployeeDetails/SaveNotes',
            type: 'post',
            dataType: 'txt',
            data: {},
            contentType: "application/txt; charset=utf-8",
            success: function () {
                alert("called ajax");
            }
        })
};