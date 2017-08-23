$(document).ready(function(){
  console.log('hurray');
  $("#saveBook").click(function(){
    console.log($("#isbn").val());
    $.ajax({
      type: "POST",
      url: "/books/create",
      data: {"isbn":$("#isbn").val(),
              "count":$("#bookCount").val()
      },
      // success: success,
      // dataType: dataType
    });

  });
});
