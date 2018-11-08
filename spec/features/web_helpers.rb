def signup
 visit '/'
 fill_in('email', with: 'test@example.com')
 fill_in('first_name', with: 'John')
 fill_in('last_name', with: 'Doe')
 fill_in('password', with: 'password123')
 fill_in('phone_number', with: '00000000')
 click_button('Sign up')
end

def create_space
 visit('/spaces/new')
 fill_in("description", with: "Two bed flat in Tooting")
 fill_in("price", with: "100")
 click_button("Submit")
end

def select_space
 click_link("Two bed flat in Tooting")
end

def create_booking
 fill_in("date", with: "25/10/2018")
 click_button("Submit")
end
