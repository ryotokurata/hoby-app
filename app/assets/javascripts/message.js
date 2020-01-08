$(function() {

  var search_list = $(".review");

  `<div class="review__box">
  <div class="review__box__image">
  <img src="/images/sample_img.gif" alt="Sample img" width="200" height="200">
  </div>
  <div class="review__box__contents">
  <div class="review__box__contents__content">
  <div class="review__box__contents__content__message">
    ${message.content}
  </div>
  <div class="right_username">
    ${message.user.name}
  さん
  </div>
  </div>
  <div class="more">
  <div class="more_list">
  <form class="button_to" method="post" action="/groups/${message.group_id}/messages/${message.id}"><input type="hidden" name="_method" value="delete"><button class="button" type="submit">削除
  </button><input type="hidden" name="authenticity_token" value="BkQEcWJVacIk7poCUOhy6e/s4KtBP90IlnDQvYBFvxEp21tWIDjlGwvk/6x7nJnYXkLpzaCYdkR8DCj5A6mjSg=="></form><form class="button_to" method="get" action="/groups/${message.group_id}/messages/${message.id}/edit"><button class="button" type="submit">編集
  </button></form></div>
  </div>
  <div class="review__box__text">
    ${message.text}
  </div>
  <div class="link-to-chat">
  <a href="/groups/${message.group_id}/messages/${message.id}/chats">チャット
  </a></div>
  </div>
  </div>`

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