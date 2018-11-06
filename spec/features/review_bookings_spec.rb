feature "landlord reviews bookings" do
  scenario "landlord views pending bookings" do
    signup
    create_space
    select_space
    create_booking
    visit('/bookings/my_bookings')
    expect(page).to have_content("Two bed flat in Tooting\n100\n25/10/2018")
  end
end
