feature "landlord can see bookings" do
  scenario "landlord can approve booking" do
    signup
    create_space
    sign_out

    sign_up_user_2
    select_space
    create_booking
    sign_out
    
    sign_in_user1
    click_link('Requests')
    click_link('received-1')
    click_button('Approve')
    expect(page).to have_content("Booking Approved")
  end

  scenario "landlord can reject a booking" do
    signup
    create_space
    sign_out

    sign_up_user_2
    select_space
    create_booking
    sign_out

    sign_in_user1
    click_link('Requests')
    click_link('received-1')
    click_button('Reject')
    expect(page).to have_content("Booking Rejected")
  end
end
