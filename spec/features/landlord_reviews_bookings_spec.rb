feature "landlord can see bookings" do
  scenario "landlord can approve booking" do
    signup
    create_space
    select_space
    create_booking
    visit('/requests')
    expect(page).to have_content("Requests I've made")
  end
end
