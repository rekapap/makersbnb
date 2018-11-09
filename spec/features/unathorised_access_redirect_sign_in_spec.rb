feature 'redirect unauthoised request to sign in page' do
  scenario 'from /spaces' do
    signup
    sign_out
    visit('/spaces')
    expect(page).to have_content('Sign in')
  end
  scenario 'from /bookings' do
    signup
    sign_out
    visit('/bookings')
    expect(page).to have_content('Sign in')
  end
  scenario 'from /bookings/1' do
    signup
    create_space
    select_space
    create_booking
    sign_out
    visit('/bookings/1')
    expect(page).to have_content('Sign in')
  end
end
