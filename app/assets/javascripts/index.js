$(document).ready(function(){
  $("#saveBook").click(function(){
    $('#addBookForm').hide();
    $('#loading').show();
    $.ajax({
      type: "POST",
      url: "/books/create",
      data: {"isbn":$("#isbn").val(),
              "count":$("#bookCount").val()
      },
      success: function(data){
        $('#loading').hide();
        $('#modalBody').hide();
        var data_hash = jQuery.parseJSON(data);
        $('#bookThumbnail').attr("src",data_hash.small_thumbnail);
        document.getElementById('book_title').innerHTML=data_hash.title;
        document.getElementById('totalCount').innerHTML='Total :'+data_hash.total_count;
        document.getElementById('availableCount').innerHTML='Avalilable :<font color=green>'+data_hash.available+'</font>';
        $('#bookDetails').show();
        // alert('success');
      },
      error: function(data) {
        $('#loading').hide();
        $('#addBookModal').hide();
        alert('failure');
      },
    });

  });
});
