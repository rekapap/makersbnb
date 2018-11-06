feature "adding space" do
 scenario "successfully" do
   signup
   create_space
   expect(page).to have_content("Two bed flat in Tooting")
 end
end
