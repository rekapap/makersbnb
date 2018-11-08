#  feature "sending sms for booking request" do  scenario "send message to saying booking request has been received" do
#     signup
#     create_space
#     select_space
#     create_booking
#     expect(FakeClient.messages.last).to eq("Hi, John! Your booking for Two bed flat in Tooting on"\
#       " 25/10/2018 has been received. Wait for confirmation from the landlord.")
#   end
# end
