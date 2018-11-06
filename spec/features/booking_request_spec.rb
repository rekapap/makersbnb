feature "tenant makes booking request" do

 scenario "booking request successfully made" do
   signup
   create_space
   select_space
   create_booking
   expect(page).to have_content("Booking requested")
 end

 # scenario "booking request rejected as space unavailale" do
 #   signup
 #   create_space
 #   select_space
 #   create_booking
 #   visit('/spaces')
 #   select_space
 #   create_booking
 #   expect(page).to have_content("Booking not available for this date")
 # end

end
