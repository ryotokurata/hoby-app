json.id      @chat.id
json.comment @chat.comment 
json.date    @chat.created_at.strftime("%Y/%m/%d %H:%M")
json.user_name @chat.user.name