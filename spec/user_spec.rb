require './lib/user'
require 'bcrypt'

describe User do
  subject { described_class }
  describe '#create_account' do
    let(:last_name) { "Doe" }
    let(:first_name) { "John" }
    let(:email) { "john@example.com" }
    let(:password) { "pass123" }

    it 'should create a user' do
      user = User.create_account(email: email, first_name: first_name,
                                 last_name: last_name, password: password)
      expect(user).to be_a(User)
    end

    it 'should encrypt the password' do
      expect(BCrypt::Password).to receive(:create).with(password)
      User.create_account(email: email, first_name: first_name, last_name: last_name, password: password)
    end
  end
end
