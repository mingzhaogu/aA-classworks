require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    User.create!(username: 'abc', password: 'password')
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }

  it { should validate_length_of(:password).is_at_least(6) }

  describe 'properly digests password' do

    it 'does not save password to database' do
      user = User.find_by(username: 'abc')
      expect(user.password).to_not eq('password')
    end

    it 'produces a password_digest' do
      user = User.find_by(username: 'abc')
      expect(user.password_digest).to_not eq(nil)
    end

    it 'identifies correct password' do
      user_params = { username: 'def', password: 'password' }
      user = User.create(user_params)
      expect(user.is_password?('password')).to be(true)
    end
  end

  describe 'Class::find_by_credentials' do

    it 'returns the correct user' do
      user = User.find_by_credentials('abc', 'password')
      user2 = User.find_by(username: 'abc')
      expect(user).to eq(user2)
    end

    it 'returns nil when it fails to find' do
      user = User.find_by_credentials('def', 'password')
      expect(user).to be(nil)
    end
  end

  describe 'session_token should be properly stored' do
    it 'ensures session token on creation' do
      user = User.new(username: 'ghi', password: 'password')
      expect(user.session_token).to_not be(nil)
    end

    it 'reset_session_token assigns a new session token' do
      user = User.find_by(username: 'abc')
      session_token = user.session_token
      expect(user.reset_session_token!).to_not eq(session_token)
    end
  end



end
