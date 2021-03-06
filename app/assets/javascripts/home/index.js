var ready = function(){

  $("#saveBook").click(function(e){
    e.preventDefault();
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
          resetAddBookModal();
          $('#addBookModal').modal('hide');
          toastr.error('Book creation failed');
        }
      });
      return false;
    }
    else{
      resetAddBookModal();
      $('#addBookModal').modal('hide');
      toastr.error('Book creation failed');
    }
  });

  $('#dashboard').click(function(){
    $(location).attr('href','dashboard');
  });

  $('#closeModal').click(function(){
    resetAddBookModal();
  });


};
$(document).on('turbolinks:load',ready);

function resetAddBookModal(){
  $('#bookDetails').hide();
  $('#modalBody').show();
  $('#loading').hide();
  document.getElementById('addBookForm').reset();
  $('#addBookForm').show();
}
