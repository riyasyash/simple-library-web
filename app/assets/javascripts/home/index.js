$(document).ready(function(){
  $("#saveBook").click(function(){
    $('#addBookForm').hide();
    if($("#isbn").val()!=""){
      $('#loading').show();
      $.ajax({
        type: "POST",
        url: "/books/create",
        data: {"isbn":$("#isbn").val(),
                "count":$("#bookCount").val()
        },
        success: function(data){
          toastr.success('Book Added');
          $('#loading').hide();
          $('#modalBody').hide();
          var data_hash = data;
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
        }
      });
      return false;
    }
    else{
      $('#loading').hide();
      $('#addBookModal').hide();
      toastr.error('Incomplete input');
    }
  });

  $('#dashboard').click(function(){
    $(location).attr('href','dashboard');
  });

  $('#closeModal').click(function(){
    $('#bookDetails').hide();
    $('#modalBody').show();
    document.getElementById('addBookForm').reset();
    $('#addBookForm').show();
  });


});
