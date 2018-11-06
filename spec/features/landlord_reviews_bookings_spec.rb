feature "landlord can see bookings" do
  scenario "landlord can approve booking" do
    signup
    create_space
    select_space
    create_booking
    visit('/users/id/bookings/pending_review')
    click_link('approve-1')
    expect(page).not_to have_content("Two bed flat in Tooting\n2018-10-2")
  end
end
