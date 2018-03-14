require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:jonny) do
    FactoryBot.build(:jonny, email: 'jonny@boi.com', password: 'password')
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "validates correct password" do
      expect(jonny.is_password?('password')).to be true
    end

    it "does not validate incorrect password" do
      expect(jonny.is_password?('wrong_password')).to be false
    end
  end
end
