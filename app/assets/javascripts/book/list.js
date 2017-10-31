var ready = function(){
    $('[data-toggle="modal"]').on('click', function(){
        var text = $(this).attr('data-isbn');
        $.ajax({
            type: "GET",
            url: "/books/"+text+"/users",
            success: function(data){
                drawTable(data,text);
            },
            error: function(data) {  
            }

      });
    });
};

$(document).on('turbolinks:load',ready);

function drawTable(data,text) {
    resetTable();
    for (var i = 0; i < data.length; i++) {
        drawRow(data[i],i,text);
    }
}

function drawRow(rowData,i,text) {
    var row = $("<tr />")
    i=i+1
    $("#bookUserTable tbody").append(row); //this will append tr element to table... keep its reference for a while since we will add cels into it
    row.append($("<td>" + i + "</td>"));
    row.append($("<td>" + rowData.name + "</td>"));
    row.append($("<td>" + rowData.updated_at.split("T")[0] + "</td>"));
    row.append($('<td><Button class="requestBookButton" data-isbn='+text+' onClick="requestBook('+text+','+rowData.id+')"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span></Button></td>'));
}

function resetTable(){
    document.getElementById('tBody').innerHTML=''
}
function requestBook(isbn,uid){
    $.ajax({
        type: "POST",
        url: "/books/"+isbn+"/users/"+uid+"/request",
        success: function(data){
            toastr.success(data.msg);
        },
        error: function(data) {  
            toastr.error(data.responseJSON.msg);
        }
  });
  return false;
}