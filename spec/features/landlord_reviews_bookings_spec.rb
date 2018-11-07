feature "landlord can see bookings" do
  scenario "landlord can approve booking" do
    signup
    create_space
    select_space
    create_booking
    visit('/users/id/bookings/pending_review')
    click_button('approve-1')
    expect(page).to have_content("Booking Approved")
  end

  scenario "landlord can reject a booking" do
    signup
    create_space
    select_space
    create_booking
    visit('/users/id/bookings/pending_review')
    click_button('reject-1')
    expect(page).to have_content("Booking Rejected")
  end
end
