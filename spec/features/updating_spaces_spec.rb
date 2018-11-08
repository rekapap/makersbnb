feature "updating space" do
 scenario "successfully" do
   signup
   create_space
   select_space
   update_space
   expect(page).to have_content("One bed flat in Tooting")
 end
end
