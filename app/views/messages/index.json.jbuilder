json.array! @messages do |message|
  json.id message.id
  json.content message.content
  json.text message.text
  json.image message.image
  json.user_id message.user_id
  json.group_id message.group_id
  json.user_name message.user.name
  json.user_sign_in current_user
end