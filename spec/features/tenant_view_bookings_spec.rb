feature "tenant can see bookings" do
  scenario "tenant views bookings" do
    signup
    create_space
    select_space
    create_booking
    visit('/users/id/bookings')
    expect(page).to have_content("Two bed flat in Tooting\n2018-10-25")
  end
end
