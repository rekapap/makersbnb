feature "tenant makes booking request" do
  scenario "booking request gets made" do
    signup
    create_space
    select_space
    create_booking
    expect(page).to have_content("Your booking has been sent")
  end
end
