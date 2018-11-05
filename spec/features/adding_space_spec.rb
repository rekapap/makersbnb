feature "adding space" do
  scenario "successfully" do
    signup
    visit('/spaces/new')
    fill_in("description", with: "two bed flat in Tooting")
    fill_in("price", with: "100")
    click_button("Submit")
    expect(page).to have_content("two bed flat in Tooting")
  end
end
