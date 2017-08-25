$(document).ready(function(){
  $('#home').click(function(){
    $(location).attr('href','index');
  });

  $('#listBooks').click(function(){
    $(location).attr('href','books');
  });
});
