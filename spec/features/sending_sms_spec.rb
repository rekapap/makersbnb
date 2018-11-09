feature "sending sms for booking request" do
  scenario "send message to saying booking request has been received" do
    signup
    create_space
    select_space
    create_booking
    expect(FakeClient.sms.last.body).to eq("Hi, John! Your booking for Two bed flat in Tooting on"\
      " 2018-10-25 has been received. Wait for confirmation from the landlord.")
  end
  scenario "send message to saying booking request was confirmed" do
    signup
    create_space

    select_space
    create_booking

    confirm_booking
    expect(FakeClient.sms.last.body).to eq("Hi, John! Your booking for Two bed flat in Tooting on"\
      " 2018-10-25 was confirmed.")
  end

  scenario "send message to saying booking request was rejected" do
    signup
    create_space

    select_space
    create_booking

    confirm_booking
    expect(FakeClient.sms.last.body).to eq("Hi, John! Your booking for Two bed flat in Tooting on"\
      " 2018-10-25 was confirmed.")
  end
end
