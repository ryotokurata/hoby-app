$(function(){
  $(document).ready(function(){
    function buildCphat(chat){
        var html = `
        <div class="chat-box-content__text">
        <div class="user-name">
        ${chat.user_name}
        さん
        </div>
        <div class="comment">
        ${chat.comment}
        </div>
        <div class="created-at">
        ${chat.date}
        </div>
        </div>
        <div class="more">
        <div class="more_list">
        <form class="button_to" method="post" action="/groups/${chat.group_id}/messages/${chat.message_id}/chats/${chat.id}"><input type="hidden" name="_method" value="delete"><button class="button" type="submit">削除
        </button><input type="hidden" name="authenticity_token" value="Vcl5Q8qhU6KEUkwSdMH5pcEBgvEz7ZUosRhAOfvEz1p6ViZkiMzfe6tYKbxftRKUcK+Ll9JKPmRbZLh9eCjTAQ=="></form></div>
        </div>`
        return html;
    };
    $('#new_chat').on('submit', function(e){
      e.preventDefault();
      var chat = new FormData(this);
      var url = (window.location.href); // $(this).attr('action')でも可能です
      $.ajax({  
        url: url,
        type: 'POST',
        data: chat,
        dataType: 'json',
        processData: false,
        contentType: false,
      })
      .done(function(chat){
        var html = buildCphat(chat);
        $('.chat-box-content').append(html)
        $('.form__submit').prop('disabled', false);
        $("#new_chat")[0].reset();
          $('.chat-box-content').animate({
            scrollTop: $('.chat-box-content')[0].scrollHeight}, "fast");
          })
      .fail(function(){
        alert('投稿がありません');
      })
      .always(function(){
        $('.form__submit').prop('disabled', false);
      })
    })
  });
 });




