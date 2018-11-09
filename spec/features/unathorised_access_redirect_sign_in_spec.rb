feature 'redirect unauthoised request to sign in page' do
  scenario 'from /spaces' do
    signup
    sign_out
    visit('/spaces')
    expect(page).to have_content('Sign in')
  end
end
