# require 'user'
# require 'database_helpers'
# describe User do
#   describe '.authenticate' do
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
# end
