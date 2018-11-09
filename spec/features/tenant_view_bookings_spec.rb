feature "tenant can see bookings" do
  scenario "tenant views bookings" do
    signup
    create_space
    select_space
    create_booking
    visit('/bookings')
    expect(page).to have_content("Requests I've made")
  end
end
