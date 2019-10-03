require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'testing get new#and post#create' do
    it 'renders :new' do
      expect(get :new).to render_template(:new)
    end
  end

  describe 'should create user' do
    subject (:user) { User.new(email: 'wood@gmail.com', password: "password", session_token: "29kdf234", password_digest: "") }
    it 'user should not be nil' do
      expect(user).to_not be_nil
    end
  end
end
