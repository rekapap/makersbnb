feature "landlord can see bookings" do
  scenario "landlord can approve booking" do
    signup
    create_space
    select_space
    create_booking
    click_link('Requests')
    click_link('received-1')
    click_button('Approve')
    expect(page).to have_content("Booking Approved")
  end

  scenario "landlord can reject a booking" do
    signup
    create_space
    select_space
    create_booking
    click_link('Requests')
    click_link('received-1')
    click_button('Reject')
    expect(page).to have_content("Booking Rejected")
  end
end
