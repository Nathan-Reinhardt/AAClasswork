json.set! @user.id do
  json.extract! @user, :id, :username
end
# maybe need to change