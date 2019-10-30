json.set! 'users' do
  json.set! @user.id do
    json.extract! @user, :id, :username
  end
end
# maybe need to change