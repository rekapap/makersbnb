feature "tenant makes booking request" do
<<<<<<< HEAD
  scenario "booking request gets made" do
    signup
    create_space
    select_space
    create_booking
    expect(page).to have_content("Your booking has been sent")
  end
=======
 scenario "booking request successfully made" do
   signup
   create_space
   select_space
   create_booking
   expect(page).to have_content("Booking requested")
 end
 scenario "booking request rejected as space unavailale" do
   signup
   create_space
   select_space
   create_booking
   visit('/spaces')
   select_space
   create_booking
   expect(page).to have_content("Booking not available for this date")
 end
>>>>>>> 79f74ad45d1e74ef3b7811d29b1134dd21572262
end
