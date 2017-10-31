var ready = function(){
    $('[data-toggle="modal"]').on('click', function(){
        var text = $(this).attr('data-isbn');
        $.ajax({
            type: "GET",
            url: "/books/"+text+"/users",
            success: function(data){
                drawTable(data);
            },
            error: function(data) {  
            }

      });
    });
};

$(document).on('turbolinks:load',ready);

function drawTable(data) {
    resetTable();
    for (var i = 0; i < data.length; i++) {
        drawRow(data[i],i);
    }
}

function drawRow(rowData,i) {
    var row = $("<tr />")
    i=i+1
    $("#bookUserTable tbody").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
    row.append($("<td>" + i + "</td>"));
    row.append($("<td>" + rowData.name + "</td>"));
    row.append($("<td>" + rowData.updated_at + "</td>"));
}

function resetTable(){
    document.getElementById('tBody').innerHTML=''
}