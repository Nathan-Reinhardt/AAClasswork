require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it {should validate_length_of(:password).is_at_least(6)}

  it {should have_many(:goals)}
  it {should have_many(:comments)}

  describe "finds user with given credentials" do 
    subject (:user1) { User.new(email: 'nate@yahoo.com', password: 'password') }
    it 'returns the user if found' do
      expect(user1).to_not be_nil
    end
  end

  describe "should reset users session token" do
    subject (:user) { User.new(email: 'test@test.io', password_digest: '123456') }
    it 'session token should not be the same' do
      expect(user.reset_session_token!).to_not eq('123456')
    end
  end

  describe "should generate a users session token" do
    subject (:user) { User.new(email: 'test@test.io', password_digest: '123456') }
    it 'should generate a session token' do
      expect(user.reset_session_token!).to_not be_nil
    end
  end

  # describe 'password should not be saved in database' do
  #   subject {user = User.new(password_digest: BCrypt::Pasword.create('password'))}
  #   it 'password should be nil' do
  #     expect(user.password).to be_nil
  #   end
  # end




end
