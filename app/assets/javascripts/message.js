$(function() {
  $(".search-form").on("keyup", function() {
    var input = $(".search-form").val();
    $.ajax({
      type: 'GET',
      url: '/messages/index',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(messages) {
      $(".review").empty();
      if (messages.length !== 0) {
        messages.forEach(function(message){
          appendMessage(message);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
  });
});