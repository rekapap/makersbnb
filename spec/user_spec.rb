require './lib/user'
require 'bcrypt'

describe User do
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

  # describe '.authenticate' do
  #     it 'returns a user given a correct username and password, if one exists' do
  #       user = User.create(email: 'test@example.com', password: 'password123')
  #       authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
  #
  #       expect(authenticated_user.id).to eq user.id
  #     end
  #   end
  #
  #   it 'returns nil given an incorrect email address' do
  #     user = User.create(email: 'test@example.com', password: 'password123')
  #
  #     expect(User.authenticate(email: 'nottherightemail@example.com', password: 'password123')).to be_nil
  #   end
end
