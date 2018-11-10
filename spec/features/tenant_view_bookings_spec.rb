feature "tenant can see bookings" do
  scenario "tenant views bookings" do
    signup
    create_space
    select_space
    create_booking
    visit('/bookings')
    expect(page).to have_content("Requests I've made")
  end
  scenario "tenant views bookings in detail" do
    signup
    create_space
    select_space
    create_booking
    visit('/bookings')
    click_link("made-1")
    expect(page).not_to have_content("Reject")
    expect(page).to have_content("Date:")
  end
end
