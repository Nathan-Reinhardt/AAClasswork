json.partial! '/api/users/user', user: @user
json.set! 'session' do
  if current_user
    json.extract! current_user, :id
  end
end
json.set! 'errors' do
  #confused
end